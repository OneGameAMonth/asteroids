/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import com.garfty.asteroids.logger.ILogger;

	import org.robotlegs.mvcs.StarlingMediator;

	import starling.events.Event;

	public class WelcomeScreenMediator extends StarlingMediator
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var view:WelcomeScreenView;

		public function WelcomeScreenMediator()
		{
			super();
		}


		override public function onRegister():void
		{
			logger.info("Welcome Screen Registered.");

			view.playButton.addEventListener(Event.TRIGGERED, onTriggered);
		}

		private function onTriggered(e:Event):void
		{
			trace ("I got clicked!");
		}


	}
}
