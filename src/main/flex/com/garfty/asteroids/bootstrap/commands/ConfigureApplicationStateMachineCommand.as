/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 31/10/2012
 * Time: 22:35
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.bootstrap.commands
{

  import com.garfty.asteroids.application.commands.DisplayApplicationCommand;
  import com.garfty.asteroids.application.commands.InitialiseApplicationCommand;
  import com.garfty.asteroids.application.commands.StartUpCompleteCommand;
  import com.garfty.asteroids.application.models.vo.ApplicationStateMachineVO;
  import com.garfty.asteroids.bootstrap.commands.robotlegs.RegisterApplicationCommands;
  import com.garfty.asteroids.bootstrap.commands.robotlegs.RegisterApplicationModels;
  import com.garfty.asteroids.bootstrap.commands.robotlegs.RegisterApplicationServices;
  import com.garfty.asteroids.bootstrap.commands.robotlegs.RegisterApplicationSignals;
  import com.garfty.asteroids.bootstrap.commands.robotlegs.RegisterApplicationSingletons;
  import com.garfty.asteroids.bootstrap.commands.robotlegs.RegisterUserInterfaceSignals;
  import com.garfty.asteroids.bootstrap.utils.ApplicationBootstrapConstants;

  import org.robotlegs.mvcs.StarlingCommand;
  import org.robotlegs.utilities.statemachine.FSMInjector;
  import org.robotlegs.utilities.statemachine.StateEvent;
  import org.robotlegs.utilities.statemachine.StateMachine;

  public class ConfigureApplicationStateMachineCommand extends StarlingCommand
  {
    [Inject]
    public var stateMachineXML:ApplicationStateMachineVO;


    public function ConfigureApplicationStateMachineCommand()
    {
      super();
    }


    override public function execute():void
    {
      var applicationStateMachineInjector:FSMInjector = new FSMInjector(stateMachineXML.xml);
      var stateMachineInjector:StateMachine = new StateMachine(eventDispatcher);

      commandMap.mapEvent(ApplicationBootstrapConstants.REGISTER_APPLICATION_COMMANDS, RegisterApplicationCommands);
      commandMap.mapEvent(ApplicationBootstrapConstants.REGISTER_APPLICATION_MODELS, RegisterApplicationModels);
      commandMap.mapEvent(ApplicationBootstrapConstants.REGISTER_APPLICATION_SERVICES, RegisterApplicationServices);
      commandMap.mapEvent(ApplicationBootstrapConstants.REGISTER_APPLICATION_SIGNALS, RegisterApplicationSignals);
      commandMap.mapEvent(ApplicationBootstrapConstants.REGISTER_APPLICATION_SINGLETONS, RegisterApplicationSingletons);
      commandMap.mapEvent(ApplicationBootstrapConstants.REGISTER_USER_INTERFACE_SIGNALS, RegisterUserInterfaceSignals);

      commandMap.mapEvent(ApplicationBootstrapConstants.INITIALISE_APPLICATION, InitialiseApplicationCommand);
      commandMap.mapEvent(ApplicationBootstrapConstants.DISPLAY_APPLICATION, DisplayApplicationCommand);

      commandMap.mapEvent(ApplicationBootstrapConstants.STARTUP_FAILED, BootsrapFailCommand);
      commandMap.mapEvent(ApplicationBootstrapConstants.STARTUP_COMPLETE, StartUpCompleteCommand);

      applicationStateMachineInjector.inject(stateMachineInjector);

      eventDispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, ApplicationBootstrapConstants.STARTUP_INITIALISED));
    }
  }
}
