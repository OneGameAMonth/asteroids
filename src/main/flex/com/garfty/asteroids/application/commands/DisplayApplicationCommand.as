/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.application.commands
{

	import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
	import com.garfty.asteroids.logger.ILogger;

	import org.robotlegs.mvcs.StarlingCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;

	public class DisplayApplicationCommand extends StarlingCommand
	{
		[Inject]
		public var logger:ILogger;


		public function DisplayApplicationCommand()
		{
			super();
		}


		override public function execute():void
		{
			logger.info("Displaying Asteroids Application");
			eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.DISPLAYING_APPLICATION_COMPLETE));
		}
	}
}
