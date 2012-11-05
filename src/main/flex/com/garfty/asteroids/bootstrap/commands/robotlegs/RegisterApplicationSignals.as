/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.bootstrap.commands.robotlegs
{

	import com.fiber.core.signals.EntityCreatedSignal;
	import com.fiber.core.signals.EntityDestroyedSignal;
	import com.fiber.core.signals.RenderSignal;
	import com.fiber.core.signals.UpdateSignal;
	import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
	import com.garfty.asteroids.game.signals.UpdatePlayerInfoSignal;
	import com.garfty.asteroids.logger.ILogger;
	import com.garfty.asteroids.userinterface.signals.DisplayDifficultySelectionSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayGameCompleteSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayGameHudSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayGameOverSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayInstructionsSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayLevelCompleteSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;
	import com.garfty.asteroids.userinterface.signals.HideDifficultySelectionSignal;
	import com.garfty.asteroids.userinterface.signals.HideGameCompleteSignal;
	import com.garfty.asteroids.userinterface.signals.HideGameHudSignal;
	import com.garfty.asteroids.userinterface.signals.HideGameOverSignal;
	import com.garfty.asteroids.userinterface.signals.HideInstructionsSignal;
	import com.garfty.asteroids.userinterface.signals.HideLevelCompleteSignal;
	import com.garfty.asteroids.userinterface.signals.HideMainMenuSignal;

	import org.robotlegs.mvcs.StarlingSignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;

	public class RegisterApplicationSignals extends StarlingSignalCommand
	{
		[Inject]
		public var logger:ILogger;


		public function RegisterApplicationSignals()
		{
			super();
		}


		override public function execute():void
		{
			logger.info("Registering Application Signals");

			// Signals from the fiber engine.
			injector.mapSingleton(RenderSignal);
			injector.mapSingleton(UpdateSignal);
			injector.mapSingleton(EntityCreatedSignal);
			injector.mapSingleton(EntityDestroyedSignal);

			// Game signals
			injector.mapSingleton(UpdatePlayerInfoSignal);

			// UI Signals
			injector.mapSingleton(DisplayGameOverSignal);
			injector.mapSingleton(HideGameOverSignal);

			injector.mapSingleton(DisplayGameHudSignal);
			injector.mapSingleton(HideGameHudSignal);

			injector.mapSingleton(DisplayMainMenuSignal);
			injector.mapSingleton(HideMainMenuSignal);

			injector.mapSingleton(DisplayLevelCompleteSignal);
			injector.mapSingleton(HideLevelCompleteSignal);

			injector.mapSingleton(DisplayGameCompleteSignal);
			injector.mapSingleton(HideGameCompleteSignal);

			injector.mapSingleton(DisplayDifficultySelectionSignal);
			injector.mapSingleton(HideDifficultySelectionSignal);

			injector.mapSingleton(DisplayInstructionsSignal);
			injector.mapSingleton(HideInstructionsSignal);

			eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.REGISTER_APPLICATION_SIGNALS_COMPLETE));
		}
	}
}
