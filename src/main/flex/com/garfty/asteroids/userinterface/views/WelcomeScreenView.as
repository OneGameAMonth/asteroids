/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;

	public class WelcomeScreenView extends Sprite
	{
		public var playButton:Sprite = new Sprite();;

		/**
		 * Constructor
		 */
		public function WelcomeScreenView()
		{
			super();

			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}


		/**
		 * 
		 * @param event
		 */
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			var q:Quad = new Quad(100, 100, 0xFFFFFF);

			playButton.useHandCursor = true;
			playButton.addChild(q);

			addChild(playButton);
		}
	}
}
