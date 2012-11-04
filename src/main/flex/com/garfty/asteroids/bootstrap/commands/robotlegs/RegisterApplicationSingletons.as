/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 09:20
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.bootstrap.commands.robotlegs
{

  import com.fiber.core.utils.EntityManager;
  import com.fiber.core.utils.GameLoopManager;
  import com.fiber.core.utils.IEntityManager;
  import com.fiber.core.utils.IGameLoopManager;
  import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
  import com.garfty.asteroids.logger.ILogger;

  import org.robotlegs.mvcs.StarlingCommand;
  import org.robotlegs.utilities.statemachine.StateEvent;

  public class RegisterApplicationSingletons extends StarlingCommand
  {
    [Inject]
    public var logger:ILogger;


    public function RegisterApplicationSingletons()
    {
    }


    override public function execute():void
    {
      logger.info("Registering Application Singletons");

      injector.mapSingletonOf(IEntityManager, EntityManager);
      injector.mapSingletonOf(IGameLoopManager, GameLoopManager);

      eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.REGISTER_APPLICATION_SINGLETONS_COMPLETE));
    }
  }
}
