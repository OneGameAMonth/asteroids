/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{

	import com.garfty.asteroids.game.signals.StartGameSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayDifficultySelectionSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayInstructionsSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;
	import com.garfty.asteroids.userinterface.signals.HideMainMenuSignal;

	import starling.events.Event;

	public class MainMenuMediator extends AsteroidsMediatorBase
	{
		[Inject]
		public var view:MainMenuView;

		[Inject]
		public var displayDifficultySelectionSignal:DisplayDifficultySelectionSignal;

		[Inject]
		public var displayInstructionsSignal:DisplayInstructionsSignal;

		[Inject]
		public var displayMainMenuSignal:DisplayMainMenuSignal;

		[Inject]
		public var hideMainMenuSignal:HideMainMenuSignal;


		public function MainMenuMediator()
		{
			super();
		}


		override public function onRegister():void
		{
			super.onRegister();

			displayMainMenuSignal.add(onDisplayMainMenu);
			hideMainMenuSignal.add(onHideMainMenu);

			view.playButton.addEventListener(Event.TRIGGERED, handlePlayButtonClicked);
			view.instructionsButton.addEventListener(Event.TRIGGERED, handleInstructionsButtonClicked);
		}


		private function onDisplayMainMenu():void
		{
			view.show();
		}


		private function onHideMainMenu():void
		{
			view.hide();
		}


		private function handlePlayButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();

			onHideMainMenu();

			view.addEventListener("mainMenuHidden", displayDifficultySelection);
		}


		private function displayDifficultySelection(event:Event):void
		{
			view.removeEventListener("mainMenuHidden", displayDifficultySelection);
			displayDifficultySelectionSignal.dispatch();
		}

		private function displayInstructionsSelection(event:Event):void
		{
			view.removeEventListener("mainMenuHidden", displayInstructionsSelection);
			displayInstructionsSignal.dispatch();
		}


		private function handleInstructionsButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();

			onHideMainMenu();

			view.addEventListener("mainMenuHidden", displayInstructionsSelection)
		}
	}
}
