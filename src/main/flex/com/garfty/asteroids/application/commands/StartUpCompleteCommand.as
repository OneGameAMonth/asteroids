/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.application.commands
{

  import com.fiber.core.signals.RenderSignal;
  import com.fiber.core.signals.UpdateSignal;
  import com.fiber.core.utils.IEntityManager;
  import com.fiber.core.utils.IGameLoopManager;
  import com.garfty.asteroids.logger.ILogger;
  import com.garfty.asteroids.userinterface.signals.DisplayMainMenuSignal;
  import com.garfty.asteroids.userinterface.views.GameCompleteMediator;
  import com.garfty.asteroids.userinterface.views.GameCompleteView;
  import com.garfty.asteroids.userinterface.views.GameOverMediator;
  import com.garfty.asteroids.userinterface.views.GameOverView;
  import com.garfty.asteroids.userinterface.views.HudMediator;
  import com.garfty.asteroids.userinterface.views.HudView;
  import com.garfty.asteroids.userinterface.views.LevelCompleteMediator;
  import com.garfty.asteroids.userinterface.views.LevelCompleteView;
  import com.garfty.asteroids.userinterface.views.MainMenuMediator;
  import com.garfty.asteroids.userinterface.views.MainMenuView;

  import org.robotlegs.mvcs.StarlingCommand;

  import starling.core.Starling;

  public class StartUpCompleteCommand extends StarlingCommand
  {
    [Inject]
    public var logger:ILogger;

    [Inject]
    public var entityManager:IEntityManager;

    [Inject]
    public var gameLoopManager:IGameLoopManager;

    [Inject]
    public var updateSignal:UpdateSignal;

    [Inject]
    public var renderSignal:RenderSignal;

    [Inject]
    public var displayMainMenuSignal:DisplayMainMenuSignal;

    public function StartUpCompleteCommand()
    {
      super();
    }


    override public function execute():void
    {
      logger.info("Asteroids Application Start Up Complete");

      // Set the stage value for the entity manager
      entityManager.stage = Starling.current.stage;
      entityManager.updateEntitiesSignal = updateSignal;
      entityManager.renderEntitiesSignal = renderSignal;

      // Set the signals for the game loop manager
      gameLoopManager.updateSignal = updateSignal;
      gameLoopManager.renderSignal = renderSignal;

      // Map the User Interface Views and Mediators.
      mediatorMap.mapView(MainMenuView, MainMenuMediator);
      mediatorMap.mapView(GameOverView, GameOverMediator);
      mediatorMap.mapView(LevelCompleteView, LevelCompleteMediator);
      mediatorMap.mapView(GameCompleteView, GameCompleteMediator);
      mediatorMap.mapView(HudView, HudMediator);

      // Add the UI Elements
      contextView.addChild(new MainMenuView());
      contextView.addChild(new GameOverView());
      contextView.addChild(new LevelCompleteView());
      contextView.addChild(new GameCompleteView());
      contextView.addChild(new HudView());

      // Show the main menu screen as the first screen
      displayMainMenuSignal.dispatch();
    }
  }
}
