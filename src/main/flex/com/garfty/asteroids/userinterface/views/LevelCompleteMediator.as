/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 13:45
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

	import com.garfty.asteroids.game.signals.StartGameSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayLevelCompleteSignal;
	import com.garfty.asteroids.userinterface.signals.HideLevelCompleteSignal;

	import org.robotlegs.base.MediatorBase;

	import starling.events.Event;

	public class LevelCompleteMediator extends org.robotlegs.base.MediatorBase
	{
		[Inject]
		public var view:LevelCompleteView;

		[Inject]
		public var displayLevelCompleteSignal:DisplayLevelCompleteSignal;

		[Inject]
		public var hideLevelCompleteSignal:HideLevelCompleteSignal;

		[Inject]
		public var startGameSignal:StartGameSignal;


		public function LevelCompleteMediator()
		{
			super();
		}


		override public function onRegister():void
		{
			// Hide the view initially.
			view.hide();

			// Add the listeners for when to display / hide the view.
			displayLevelCompleteSignal.add(onDisplayLevelComplete);
			hideLevelCompleteSignal.add(onHideLevelComplete);

			// Add the listener for when the continue button is triggered.
			view.continueButton.addEventListener(Event.TRIGGERED, handleContinueButtonTriggered);
		}


		private function handleContinueButtonTriggered(event:Event):void
		{
			onHideLevelComplete();
			startGameSignal.dispatch("");
		}


		private function onDisplayLevelComplete():void
		{
			view.show();
		}


		private function onHideLevelComplete():void
		{
			view.hide();
		}
	}
}
