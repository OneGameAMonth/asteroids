/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.application.commands
{
	import com.garfty.asteroids.application.models.vo.ApplicationStateMachineVO;
	import com.garfty.asteroids.logger.ILogger;

	import org.robotlegs.mvcs.StarlingCommand;

	public class StartUpCompleteCommand extends StarlingCommand
	{
		[Inject]
		public var logger:ILogger;

		public function StartUpCompleteCommand()
		{
			super();
		}


		override public function execute():void
		{
			logger.info("Asteroids Application Start Up Complete");
		}
	}
}
