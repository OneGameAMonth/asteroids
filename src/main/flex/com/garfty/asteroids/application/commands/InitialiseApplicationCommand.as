/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.application.commands
{
	import com.garfty.asteroids.application.models.IEnvironmentModel;
	import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
	import com.garfty.asteroids.logger.ILogger;

	import org.robotlegs.mvcs.StarlingCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;

	import starling.core.Starling;

	public class InitialiseApplicationCommand extends StarlingCommand
	{
		[Inject]
		public var logger:ILogger;


		[Inject]
		public var environmentModel:IEnvironmentModel;
		
		
		public function InitialiseApplicationCommand()
		{
			super();
		}


		override public function execute():void
		{
			logger.info("Initialising Asteroids Application");

			environmentModel.flashVars = Starling.current.nativeStage.loaderInfo.parameters || {};

			environmentModel.assetPath = environmentModel.getFlashVar("assetPath");
			environmentModel.servicePath = environmentModel.getFlashVar("servicePath");
			environmentModel.swfPath = environmentModel.getFlashVar("swfPath");

			eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.APPLICATION_INITIALISATION_COMPLETE));
		}
	}
}
