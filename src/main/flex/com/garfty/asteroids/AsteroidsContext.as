/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 31/10/2012
 * Time: 22:04
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids
{

  import com.garfty.asteroids.application.models.vo.ApplicationStateMachineVO;
  import com.garfty.asteroids.bootstrap.commands.ConfigureApplicationStateMachineCommand;
  import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;
  import com.garfty.asteroids.logger.BasicLogger;
  import com.garfty.asteroids.logger.ILogger;

  import org.robotlegs.base.ContextEvent;
  import org.robotlegs.mvcs.StarlingSignalContext;

  import starling.display.DisplayObjectContainer;

  public class AsteroidsContext extends StarlingSignalContext
  {
    protected var _logger:ILogger;

    protected var _stateMachineXML:XML;


    public function AsteroidsContext(contextView:DisplayObjectContainer, autoStartup:Boolean = true)
    {
      super(contextView, autoStartup);

      _stateMachineXML = ApplicationBootstrapConstants.applicationStateMachineXML;

      injector.mapValue(ApplicationStateMachineVO, new ApplicationStateMachineVO(_stateMachineXML));

      initialiseStartup();
    }


    private function initialiseStartup():void
    {
      _logger = injector.instantiate(BasicLogger);
      _logger.info("Starting Asteroids");
      injector.mapValue(ILogger, _logger);

      commandMap.mapEvent(ContextEvent.STARTUP, ConfigureApplicationStateMachineCommand, ContextEvent, true);
      dispatchEvent(new ContextEvent(ContextEvent.STARTUP));

      startup();
    }


    override public function startup():void
    {
      super.startup();
      commandMap.unmapEvent(ContextEvent.STARTUP, ConfigureApplicationStateMachineCommand, ContextEvent);
    }
  }
}
