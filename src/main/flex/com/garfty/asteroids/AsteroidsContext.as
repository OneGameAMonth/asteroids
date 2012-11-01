/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 31/10/2012
 * Time: 22:04
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids
{

  import com.garfty.asteroids.bootstrap.commands.ConfigureStateMachineCommand;
  import com.garfty.asteroids.logger.BasicLogger;
  import com.garfty.asteroids.logger.ILogger;

  import org.robotlegs.base.ContextEvent;
  import org.robotlegs.mvcs.StarlingSignalContext;

  import starling.display.DisplayObjectContainer;

  public class AsteroidsContext extends StarlingSignalContext
  {
    protected var _logger:ILogger;

    public function AsteroidsContext(contextView:DisplayObjectContainer, autoStartup:Boolean = true)
    {
      super(contextView, autoStartup);
      initialiseStartup();
    }


    private function initialiseStartup():void
    {
      _logger = injector.instantiate(BasicLogger);
      _logger.info("Starting Asteroids");
      injector.mapValue(ILogger, _logger);

      commandMap.mapEvent(ContextEvent.STARTUP, ConfigureStateMachineCommand, ContextEvent, true);
      dispatchEvent(new ContextEvent(ContextEvent.STARTUP));

      startup();
    }


    override public function startup():void
    {
      super.startup();
      commandMap.unmapEvent(ContextEvent.STARTUP, ConfigureStateMachineCommand, ContextEvent);
    }
  }
}
