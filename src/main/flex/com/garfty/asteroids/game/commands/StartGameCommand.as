/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.game.commands
{

	import com.fiber.core.IEntity;
	import com.fiber.core.utils.IEntityManager;
	import com.fiber.core.utils.IGameLoopManager;
	import com.garfty.asteroids.game.entities.Asteroid;
	import com.garfty.asteroids.game.entities.Ship;
	import com.garfty.asteroids.game.models.IGameModel;
	import com.garfty.asteroids.game.models.vo.PlayerInfoVO;
	import com.garfty.asteroids.game.signals.GameOverSignal;
	import com.garfty.asteroids.game.signals.LevelCompleteSignal;
	import com.garfty.asteroids.game.signals.UpdatePlayerInfoSignal;
	import com.garfty.asteroids.logger.ILogger;
	import com.garfty.asteroids.userinterface.signals.DisplayGameHudSignal;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class StartGameCommand extends StarlingSignalCommand
	{
		[Inject]
		public var logger:ILogger;

		[Inject]
		public var difficulty:String;

		[Inject]
		public var entityManager:IEntityManager;

		[Inject]
		public var gameLoopManager:IGameLoopManager;

		[Inject]
		public var gameModel:IGameModel;

		[Inject]
		public var gameOverSignal:GameOverSignal;

		[Inject]
		public var updatePlayerInfoSignal:UpdatePlayerInfoSignal;

		[Inject]
		public var levelCompleteSignal:LevelCompleteSignal;

		[Inject]
		public var displayGameHudSignal:DisplayGameHudSignal;

		private var _ship:IEntity;
		private var _asteroid:IEntity;
		private var _pickup:IEntity;

		private var _pickupTimer:Timer;
		private var _pickupTimerRepeatMax:Number = 5;
		private var _pickupTimerRepeatMin:Number = 2;
		private var _pickupTimerDelayMax:Number = 60000;
		private var _pickupTimerDelayMin:Number = 30000;


		public function StartGameCommand()
		{
			super();
		}


		override public function execute():void
		{
			// Start the game loop
			gameLoopManager.startGameLoop();

			// Set the difficulty.
			if (gameModel.difficulty == "" || gameModel.difficulty != difficulty) {
				gameModel.difficulty = difficulty;
			}

			// The game is not over, it's only just begun...
			gameModel.gameOver = false;

			// Specify the android count, depending on the players difficulty and level
			var asteroidCount:int = gameModel.asteroidCount[gameModel.level - 1];

			// Generate the asteroids
			for (var i:int = 0; i < asteroidCount; ++i) {
				_asteroid = new Asteroid();
				_asteroid.targets = gameModel.players;
				_asteroid.destroyedSignal.add(handleAsteroidDestroyed);
				_asteroid.group = gameModel.enemies;
				_asteroid.group.push(_asteroid);
				entityManager.addEntity(_asteroid);
			}

			// Create the player ship
			createShip();

			// Update the player information
			updatePlayerInfoSignal.dispatch(new PlayerInfoVO(gameModel.score, gameModel.lives, _ship.weapon.ammoCount, _ship.teleport.teleportCount));
			displayGameHudSignal.dispatch();

			// Create a timer to dispatch a random pickup for the player, the time between pickups
			// are varied and have no bearing on how the player is performing. Performance monitoring
			// could be something built in at a later date.
			var delay:Number = Math.floor(Math.random()*(_pickupTimerDelayMax - _pickupTimerDelayMin + 1) + _pickupTimerDelayMin);
			var repeat:Number = Math.floor(Math.random()*(_pickupTimerRepeatMax - _pickupTimerRepeatMax + 1) + _pickupTimerRepeatMin);

			_pickupTimer = new Timer(delay, repeat);
			_pickupTimer.addEventListener(TimerEvent.TIMER, createRandomPickup);
			_pickupTimer.start();
		}


		private function handleAsteroidDestroyed(entity:IEntity):void
		{
			if (gameModel.gameOver) {
				return;
			}

			var radius:Number = int((entity.body.radius*.65)*10)/10;
			var scale:Number = int((entity.view.scale*.65)*10)/10;

			if (radius > 12) {
				for (var i:int = 0; i < 2; ++i) {
					_asteroid = new Asteroid();
					_asteroid.targets = gameModel.players;
					_asteroid.destroyedSignal.add(handleAsteroidDestroyed);
					_asteroid.body.x = entity.body.x;
					_asteroid.body.y = entity.body.y;
					_asteroid.body.radius = radius;
					_asteroid.view.scale = scale;
					_asteroid.group = gameModel.enemies;
					_asteroid.group.push(_asteroid);
					entityManager.addEntity(_asteroid);
				}
			}

			// Update the players score dependant on the size of the asteroid
			if (entity.body.radius == 30) {
				gameModel.incrementScore(20);
			}

			if (entity.body.radius == 19.5) {
				gameModel.incrementScore(50);
			}

			if (entity.body.radius == 12.6) {
				gameModel.incrementScore(100);
			}


			// Check to see if the user has completed the level
			if (gameModel.enemies.length == 0) {
				_pickupTimer.stop();
				_pickupTimer.removeEventListener(TimerEvent.TIMER, createRandomPickup);
				_pickupTimer = null;

				levelCompleteSignal.dispatch();
			}

			dispatchHudUpdate(entity);
		}


		private function handleShipDestroyed(entity:IEntity):void
		{
			// Reduce the amount of lives the player has
			gameModel.decrementLives(1);

			// Detect if the players game is over
			if (gameModel.lives <= 0) {
				gameOver();
			}
			else {
				createShip();
			}

			dispatchHudUpdate(entity);
		}


		private function gameOver():void
		{
			_pickupTimer.stop();
			_pickupTimer.removeEventListener(TimerEvent.TIMER, createRandomPickup);
			_pickupTimer = null;

			gameModel.gameOver = true;
			gameOverSignal.dispatch(new PlayerInfoVO(gameModel.score, gameModel.lives, _ship.weapon.ammoCount, _ship.teleport.teleportCount));
		}


		private function createShip():void
		{
			_ship = new Ship();
			_ship.targets = gameModel.enemies;
			_ship.destroyedSignal.add(handleShipDestroyed);
			_ship.weapon.weaponFiredSignal.add(dispatchHudUpdate);
			_ship.weapon.receivedAmmoSignal.add(dispatchHudUpdate);
			_ship.teleport.teleportEngagedSignal.add(dispatchHudUpdate);
			_ship.teleport.teleportReceivedSignal.add(dispatchHudUpdate);
			_ship.group = gameModel.players;
			_ship.group.push(_ship);
			entityManager.addEntity(_ship);
		}


		private function dispatchHudUpdate(entity:IEntity):void
		{
			updatePlayerInfoSignal.dispatch(new PlayerInfoVO(gameModel.score, gameModel.lives, _ship.weapon.ammoCount, _ship.teleport.teleportCount));
		}


		private function createRandomPickup(event:TimerEvent):void
		{
			// Set a new delay on the next timer event
			var delay:Number = Math.floor(Math.random()*(_pickupTimerDelayMax - _pickupTimerDelayMin + 1) + _pickupTimerDelayMin);
			_pickupTimer.delay = delay;

			var Pickup:Class = gameModel.pickups[Math.floor(Math.random()*((gameModel.pickups.length - 1) - 0 + 1) + 0)];

			_pickup = new Pickup();
			_pickup.targets = gameModel.players;
			_pickup.group = gameModel.collectables;
			_pickup.group.push(_pickup);
			entityManager.addEntity(_pickup);
		}
	}
}
