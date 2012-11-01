/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.bootstrap.commands.robotlegs
{
	import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
	import com.garfty.asteroids.game.commands.HandleGameCompleteCommand;
	import com.garfty.asteroids.game.commands.HandleGameOverCommand;
	import com.garfty.asteroids.game.commands.HandleLevelCompleteCommand;
	import com.garfty.asteroids.game.commands.StartGameCommand;
	import com.garfty.asteroids.game.signals.GameCompleteSignal;
	import com.garfty.asteroids.game.signals.GameOverSignal;
	import com.garfty.asteroids.game.signals.LevelCompleteSignal;
	import com.garfty.asteroids.game.signals.StartGameSignal;
	import com.garfty.asteroids.logger.ILogger;

	import org.robotlegs.mvcs.StarlingSignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;

	public class RegisterApplicationCommands extends StarlingSignalCommand
	{
		[Inject]
		public var logger:ILogger;

		public function RegisterApplicationCommands()
		{
			super();
		}


		override public function execute():void
		{
			logger.info("Registering Application Commands");

			signalCommandMap.mapSignalClass(StartGameSignal, StartGameCommand);

			signalCommandMap.mapSignalClass(GameOverSignal, HandleGameOverCommand);
			signalCommandMap.mapSignalClass(GameCompleteSignal, HandleGameCompleteCommand);
			signalCommandMap.mapSignalClass(LevelCompleteSignal, HandleLevelCompleteCommand);

			eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.REGISTER_APPLICATION_COMMANDS_COMPLETE));
		}
	}
}
