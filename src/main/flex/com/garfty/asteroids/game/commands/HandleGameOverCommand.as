/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.game.commands
{

	import com.fiber.core.utils.IEntityManager;
	import com.fiber.core.utils.IGameLoopManager;
	import com.garfty.asteroids.game.models.IGameModel;
	import com.garfty.asteroids.game.models.vo.PlayerInfoVO;
	import com.garfty.asteroids.userinterface.signals.DisplayGameOverSignal;
	import com.garfty.asteroids.userinterface.signals.HideGameHudSignal;

	import flash.utils.setTimeout;

	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class HandleGameOverCommand extends StarlingSignalCommand
	{
		[Inject]
		public var playerInfoVO:PlayerInfoVO;

		[Inject]
		public var entityManager:IEntityManager;

		[Inject]
		public var gameLoopManager:IGameLoopManager;

		[Inject]
		public var gameModel:IGameModel;

		[Inject]
		public var displayGameOverSignal:DisplayGameOverSignal;

		[Inject]
		public var hideGameHudSignal:HideGameHudSignal;


		public function HandleGameOverCommand()
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

			// Reset the game model
			gameModel.lives = gameModel.maxLives;
			gameModel.score = 0;
			gameModel.level = 1;

			// Stop the game loop, for performance issues.
			gameLoopManager.stopGameLoop();

			// Show the appropriate ui elements
			hideGameHudSignal.dispatch();
			displayGameOverSignal.dispatch();
		}
	}
}
