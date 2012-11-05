/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 31/10/2012
 * Time: 22:43
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.bootstrap.commands
{

	import com.garfty.asteroids.logger.ILogger;

	import org.robotlegs.mvcs.SignalCommand;

	public class BootsrapFailCommand extends SignalCommand
	{

		[Inject]
		public var logger:ILogger;


		public function BootsrapFailCommand()
		{
			super();
		}


		override public function execute():void
		{
			logger.fatal("Asteroids Bootstrap Failed.");
		}
	}
}
