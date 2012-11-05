/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.game.commands
{

	import com.fiber.core.utils.IEntityManager;
	import com.fiber.core.utils.IGameLoopManager;
	import com.garfty.asteroids.game.models.IGameModel;
	import com.garfty.asteroids.logger.ILogger;
	import com.garfty.asteroids.userinterface.signals.DisplayGameCompleteSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayLevelCompleteSignal;

	import flash.utils.setTimeout;

	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class HandleLevelCompleteCommand extends StarlingSignalCommand
	{
		[Inject]
		public var logger:ILogger;

		[Inject]
		public var gameModel:IGameModel;

		[Inject]
		public var displayLevelCompleteSignal:DisplayLevelCompleteSignal;

		[Inject]
		public var displayGameCompleteSignal:DisplayGameCompleteSignal;

		[Inject]
		public var entityManager:IEntityManager;

		[Inject]
		public var gameLoopManager:IGameLoopManager;


		public function HandleLevelCompleteCommand()
		{
			super();
		}


		override public function execute():void
		{
			// Destroy all entities on stage.
			setTimeout(entityManager.destroyAllEntities, 50);

			// Reset the game models enemies and players.
			gameModel.enemies.length = 0;
			gameModel.players.length = 0;

			// Reset the players lives
			gameModel.lives = gameModel.maxLives;

			// Stop the game loop
			gameLoopManager.stopGameLoop();

			// Increase the players level
			gameModel.level++;

			// Detect if there is another level, or if the user has completed the game.
			if (gameModel.level - 1 < gameModel.asteroidCount.length) {
				displayLevelCompleteSignal.dispatch();
			}
			else {
				displayGameCompleteSignal.dispatch();
			}
		}
	}
}
