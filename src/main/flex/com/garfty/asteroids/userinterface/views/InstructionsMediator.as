/**
 * User: Ken
 * Date: 05/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import com.garfty.asteroids.userinterface.signals.DisplayInstructionsSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;
	import com.garfty.asteroids.userinterface.signals.HideInstructionsSignal;

	import starling.events.Event;

	public class InstructionsMediator extends AsteroidsMediatorBase
	{
		[Inject]
		public var view:InstructionsView;

		[Inject]
		public var displayMainMenuSignal:DisplayMainMenuSignal;
		
		[Inject]
		public var displayInstructionsSignal:DisplayInstructionsSignal;

		[Inject]
		public var hideInstructionsSignal:HideInstructionsSignal;

		public function InstructionsMediator()
		{
			super();
		}


		override public function onRegister():void
		{
			super.onRegister();

			displayInstructionsSignal.add(onDisplayInstructions);
			hideInstructionsSignal.add(onHideInstructions);

			view.backButton.addEventListener(Event.TRIGGERED, handleBackButtonTriggered);
		}


		private function handleBackButtonTriggered(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();

			onHideInstructions();

			displayMainMenuSignal.dispatch();
		}


		private function onDisplayInstructions():void
		{
			view.show();
		}


		private function onHideInstructions():void
		{
			view.hide();
		}
	}
}
