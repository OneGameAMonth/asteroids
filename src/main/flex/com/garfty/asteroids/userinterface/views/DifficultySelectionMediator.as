/**
 * User: Ken
 * Date: 05/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import com.garfty.asteroids.game.models.constants.GameDifficultyConstants;
	import com.garfty.asteroids.game.signals.StartGameSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayDifficultySelectionSignal;
	import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;
	import com.garfty.asteroids.userinterface.signals.HideDifficultySelectionSignal;

	import starling.events.Event;

	public class DifficultySelectionMediator extends AsteroidsMediatorBase
	{
		[Inject]
		public var view:DifficultySelectionView;

		[Inject]
		public var startGameSignal:StartGameSignal;

		[Inject]
		public var displayMainMenuSignal:DisplayMainMenuSignal;
		
		[Inject]
		public var displayDifficultySelectionSignal:DisplayDifficultySelectionSignal;

		[Inject]
		public var hideDifficultySelectionSignal:HideDifficultySelectionSignal;


		public function DifficultySelectionMediator()
		{
			super();
		}


		override public function onRegister():void
		{
			super.onRegister();

			displayDifficultySelectionSignal.add(onDifficultySelectionShow);
			hideDifficultySelectionSignal.add(onDifficultySelectionHide);

			view.easyButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);
			view.mediumButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);
			view.hardButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);
			view.insaneButton.addEventListener(Event.TRIGGERED, handleDifficultyButtonClicked);

			view.backButton.addEventListener(Event.TRIGGERED, handleBackButtonClicked);
		}


		private function handleBackButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();
			onDifficultySelectionHide();
			displayMainMenuSignal.dispatch();
		}


		private function onDifficultySelectionShow():void
		{
			view.show();
		}


		private function onDifficultySelectionHide():void
		{
			view.hide();
		}


		private function handleDifficultyButtonClicked(event:Event):void
		{
			_buttonClickSoundChannel = _buttonClickSound.play();
			onDifficultySelectionHide();

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
	}
}
