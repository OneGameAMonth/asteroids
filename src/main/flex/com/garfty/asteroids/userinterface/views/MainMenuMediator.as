/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{

  import com.garfty.asteroids.game.signals.StartGameSignal;
  import com.garfty.asteroids.logger.ILogger;
  import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;
  import com.garfty.asteroids.userinterface.signals.HideMainMenuSignal;

  import org.robotlegs.mvcs.StarlingMediator;

  import starling.events.Event;

  public class MainMenuMediator extends StarlingMediator
  {
    [Inject]
    public var logger:ILogger;

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
      logger.info("Welcome Screen Registered.");

      // Initially hide the view until it's required
      view.hide();

      // Add the show and hide signal functions
      displayMainMenuSignal.add(onDisplayMainMenu);
      hideMainMenuSignal.add(onHideMainMenu);

      // Listen for the player to trigger the play command
      view.playButton.addEventListener(Event.TRIGGERED, handlePlayButtonClicked);
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
      view.hide();
      startGameSignal.dispatch();
    }
  }
}
