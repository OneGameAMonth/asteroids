/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.bootstrap.commands.robotlegs
{
	import com.garfty.asteroids.application.models.EnvironmentModel;
	import com.garfty.asteroids.application.models.IEnvironmentModel;
	import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
	import com.garfty.asteroids.logger.ILogger;

	import org.robotlegs.mvcs.StarlingSignalCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;

	public class RegisterApplicationModels extends StarlingSignalCommand
	{
		[Inject]
		public var logger:ILogger;


		public function RegisterApplicationModels()
		{
			super();
		}


		override public function execute():void
		{
			logger.info("Registering Application Models");

			injector.mapSingletonOf(IEnvironmentModel, EnvironmentModel);

			eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.REGISTER_APPLICATION_MODELS_COMPLETE));
		}
	}
}
