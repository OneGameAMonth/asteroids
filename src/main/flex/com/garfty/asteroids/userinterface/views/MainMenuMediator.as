/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{

	import com.garfty.asteroids.game.models.constants.GameDifficultyConstants;
	import com.garfty.asteroids.game.signals.StartGameSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;
	import com.garfty.asteroids.userinterface.signals.HideMainMenuSignal;

	import starling.events.Event;

	public class MainMenuMediator extends MediatorBase
	{
		[Inject]
		public var view:MainMenuView;

		[Inject]
		public var startGameSignal:StartGameSignal;

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

			logger.info("Main Menu Screen Registered.");

			// Initially hide the view until it's required
			view.hide();

			// Add the show and hide signal functions
			displayMainMenuSignal.add(onDisplayMainMenu);
			hideMainMenuSignal.add(onHideMainMenu);

			// Listen for the triggers from the view buttons
			view.playButton.addEventListener(Event.TRIGGERED, handlePlayButtonClicked);
			view.instructionsButton.addEventListener(Event.TRIGGERED, handleInstructionsButtonClicked);

			view.easyButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);
			view.mediumButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);
			view.hardButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);
			view.insaneButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);

			view.backButton.addEventListener(Event.TRIGGERED, handleBackButtonClicked);
		}


		private function onDisplayMainMenu():void
		{
			view.show();
			view.showWelcomeScreen();
		}


		private function onHideMainMenu():void
		{
			view.hide();
		}


		private function handlePlayButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();
			view.showDifficultyScreen();
		}


		private function handleInstructionsButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();
			view.showInstructionsScreen();
		}


		private function handleDifficultyButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();
			view.hide();

			switch (event.target) {
				case view.easyButton:
					startGameSignal.dispatch(GameDifficultyConstants.EASY);
					break;
				case view.mediumButton:
					startGameSignal.dispatch(GameDifficultyConstants.MEDIUM);
					break;
				case view.hardButton:
					startGameSignal.dispatch(GameDifficultyConstants.HARD);
					break;
				case view.insaneButton:
					startGameSignal.dispatch(GameDifficultyConstants.INSANE);
					break;
			}

		}


		public function handleBackButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();
			view.showWelcomeScreen();
		}
	}
}
