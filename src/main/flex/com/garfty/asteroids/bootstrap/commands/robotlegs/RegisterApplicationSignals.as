/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.bootstrap.commands.robotlegs
{
	import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
	import com.garfty.asteroids.logger.ILogger;

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

			eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.REGISTER_APPLICATION_SIGNALS_COMPLETE));
		}
	}
}
