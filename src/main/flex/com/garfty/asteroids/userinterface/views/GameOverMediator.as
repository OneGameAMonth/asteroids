/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 12:08
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

	import com.garfty.asteroids.game.signals.StartGameSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayGameOverSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;

	import org.robotlegs.mvcs.StarlingMediator;

	import starling.events.Event;

	public class GameOverMediator extends StarlingMediator
	{
		[Inject]
		public var view:GameOverView;

		[Inject]
		public var displayGameOverSignal:DisplayGameOverSignal;

		[Inject]
		public var displayMainMenuSignal:DisplayMainMenuSignal;

		[Inject]
		public var startGameSignal:StartGameSignal;


		public function GameOverMediator()
		{
			super();
		}


		override public function onRegister():void
		{
			view.hide();

			view.restartGameButton.addEventListener(Event.TRIGGERED, onRestartGameTriggered);
			view.mainMenuButton.addEventListener(Event.TRIGGERED, onMainMenuTriggered);

			displayGameOverSignal.add(handleGameOver);
		}


		private function onRestartGameTriggered(event:Event):void
		{
			view.hide()
			startGameSignal.dispatch("");
		}


		private function onMainMenuTriggered(event:Event):void
		{
			view.hide();
			displayMainMenuSignal.dispatch();
		}


		private function handleGameOver():void
		{
			view.show();
		}
	}
}
