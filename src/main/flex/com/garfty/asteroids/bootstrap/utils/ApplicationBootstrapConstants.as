/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.bootstrap.utils
{
	public class ApplicationBootstrapConstants
	{
		/**
		 * Robotlegs Constants
		 */
		public static const STARTUP_INITIALISING:String = 'state/startup/initialising';
		public static const STARTUP_INITIALISED:String = 'action/startup/initialised';
		public static const INITIALISATION_FAILED:String = 'action/startup/initialisationFailed';

		public static const REGISTER_APPLICATION_SIGNALS:String = 'event/robotlegs/registerApplicationSignals';
		public static const REGISTERING_APPLICATION_SIGNALS:String = 'state/robotlegs/registeringApplicationSignals';
		public static const REGISTER_APPLICATION_SIGNALS_COMPLETE:String = 'action/robotlegs/registerApplicationSignalsComplete';
		public static const REGISTER_APPLICATION_SIGNALS_ERROR:String = 'action/robotlegs/registerApplicationSignalsError';

		public static const REGISTER_USER_INTERFACE_SIGNALS:String = 'event/robotlegs/registerUserInterfaceSignals';
		public static const REGISTERING_USER_INTERFACE_SIGNALS:String = 'state/robotlegs/registeringUserInterfaceSignals';
		public static const REGISTER_USER_INTERFACE_SIGNALS_COMPLETE:String = 'action/robotlegs/registerUserInterfaceSignalsComplete';
		public static const REGISTER_USER_INTERFACE_SIGNALS_ERROR:String = 'action/robotlegs/registerUserInterfaceSignalsError';

		public static const REGISTER_APPLICATION_MODELS:String = 'event/robotlegs/registerApplicationModels';
		public static const REGISTERING_APPLICATION_MODELS:String = 'state/robotlegs/registeringApplicationModels';
		public static const REGISTER_APPLICATION_MODELS_COMPLETE:String = 'action/robotlegs/registerApplicationModelsComplete';
		public static const REGISTER_APPLICATION_MODELS_ERROR:String = 'action/robotlegs/registerApplicationModelsError';

		public static const REGISTER_APPLICATION_SERVICES:String = 'event/robotlegs/registerApplicationServices';
		public static const REGISTERING_APPLICATION_SERVICES:String = 'state/robotlegs/registeringApplicationServices';
		public static const REGISTER_APPLICATION_SERVICES_COMPLETE:String = 'action/robotlegs/registerApplicationServicesComplete';
		public static const REGISTER_APPLICATION_SERVICES_ERROR:String = 'action/robotlegs/registerApplicationServicesError';

		public static const REGISTER_APPLICATION_COMMANDS:String = 'event/robotlegs/registerApplicationCommands';
		public static const REGISTERING_APPLICATION_COMMANDS:String = 'state/robotlegs/registeringApplicationCommands';
		public static const REGISTER_APPLICATION_COMMANDS_COMPLETE:String = 'actions/robotlegs/registerApplicationCommandsComplete';
		public static const REGISTER_APPLICATION_COMMANDS_ERROR:String = 'actions/robotlegs/registerApplicationCommandsError';

		public static const STARTUP_FAILED:String = 'event/startup/failed';
		public static const STARTUP_FAILING:String = 'state/startup/failing';

		public static const STARTUP_COMPLETE:String = 'event/startup/complete';
		public static const STARTUP_COMPLETING:String = 'state/startup/completing';

		/**
		 * Application Constants
		 */
		public static const INITIALISE_APPLICATION:String = 'event/initialiseApplication';
		public static const INITIALISING_APPLICATION:String = 'state/initialisingApplication';
		public static const APPLICATION_INITIALISATION_COMPLETE:String = 'action/applicationInitialisationComplete';
		public static const APPLICATION_INITIALISATION_ERROR:String = 'action/applicationInitialisationError';

		public static const DISPLAY_APPLICATION:String = 'event/displayApplication';
		public static const DISPLAYING_APPLICATION:String = 'state/displayingApplication';
		public static const DISPLAYING_APPLICATION_COMPLETE:String = 'action/displayingApplicationComplete';

		/**
		 * External Assets Constants
		 */
		public static const TEXTURES_LOAD:String = 'event/loading/texturesLoad';
		public static const TEXTURES_LOADING:String = "state/loading/texturesLoading";
		public static const TEXTURES_LOAD_COMPLETE:String = "action/loading/texturesLoadComplete";
		public static const TEXTURES_LOAD_ERROR:String = "action/loading/texturesLoadError";

		public static const TEXTURE_ATLAS_LOAD:String = "event/loading/textureAtlasLoad";
		public static const TEXTURE_ATLAS_LOADING:String = "state/loading/textureAtlasLoading";
		public static const TEXTURE_ATLAS_LOAD_COMPLETE:String = "action/loading/textureAtlasLoadComplete";
		public static const TEXTURE_ATLAS_LOAD_ERROR:String = "action/loading/textureAtlasLoadError";


		/**
		 * Initial start up phase
		 */
		private static const APPLICATION_BOOTSTRAP:XML =
				<fsm>
					<state name={STARTUP_INITIALISING}>
						<transition action={STARTUP_INITIALISED} target={REGISTERING_USER_INTERFACE_SIGNALS} />
						<transition action={INITIALISATION_FAILED} target={STARTUP_FAILING} />
					</state>
					<state name={REGISTERING_USER_INTERFACE_SIGNALS} changed={REGISTER_USER_INTERFACE_SIGNALS}>
						<transition action={REGISTER_USER_INTERFACE_SIGNALS_COMPLETE} target={REGISTERING_APPLICATION_SIGNALS} />
						<transition action={REGISTER_USER_INTERFACE_SIGNALS_ERROR} target={STARTUP_FAILING} />
					</state>
					<state name={REGISTERING_APPLICATION_SIGNALS} changed={REGISTER_APPLICATION_SIGNALS}>
						<transition action={REGISTER_APPLICATION_SIGNALS_COMPLETE} target={REGISTERING_APPLICATION_MODELS} />
						<transition action={REGISTER_APPLICATION_SIGNALS_ERROR} target={STARTUP_FAILING} />
					</state>
					<state name={REGISTERING_APPLICATION_MODELS} changed={REGISTER_APPLICATION_MODELS}>
						<transition action={REGISTER_APPLICATION_MODELS_COMPLETE} target={REGISTERING_APPLICATION_SERVICES} />
						<transition action={REGISTER_APPLICATION_MODELS_ERROR} target={STARTUP_FAILING} />
					</state>
					<state name={REGISTERING_APPLICATION_SERVICES} changed={REGISTER_APPLICATION_SERVICES}>
						<transition action={REGISTER_APPLICATION_SERVICES_COMPLETE} target={REGISTERING_APPLICATION_COMMANDS} />
						<transition action={REGISTER_APPLICATION_SERVICES_ERROR} target={STARTUP_FAILING} />
					</state>
					<state name={REGISTERING_APPLICATION_COMMANDS} changed={REGISTER_APPLICATION_COMMANDS}>
						<transition action={REGISTER_APPLICATION_COMMANDS_COMPLETE} target={INITIALISING_APPLICATION} />
						<transition action={REGISTER_APPLICATION_COMMANDS_ERROR} target={STARTUP_FAILING} />
					</state>
					<state name={INITIALISING_APPLICATION} changed={INITIALISE_APPLICATION}>
						<transition action={APPLICATION_INITIALISATION_COMPLETE} target={DISPLAYING_APPLICATION} />
						<transition action={APPLICATION_INITIALISATION_ERROR} target={STARTUP_FAILING} />
					</state>
					<state name={DISPLAYING_APPLICATION} changed={DISPLAY_APPLICATION}>
						<transition action={DISPLAYING_APPLICATION_COMPLETE} target={STARTUP_COMPLETING} />
					</state>
				</fsm>;


		/**
		 * Success - Bootstrap is now complete
		 */
		private static const BOOTSTRAP_COMPLETE:XML =
				<fsm>
					<state name={STARTUP_COMPLETING} changed={STARTUP_COMPLETE} />
				</fsm>;

		/**
		 * Fail - hopefully we never see this!
		 */
		private static const BOOTSTRAP_FAIL:XML =
				<fsm>
					<state name={STARTUP_FAILING} changed={STARTUP_FAILED} />
				</fsm>;


		/**
		 * Constructor
		 */
		public function ApplicationBootstrapConstants()
		{
			throw new Error("Magic Town FSM Should not be instantiated.");
		}


		/**
		 * Generates an FSM to load the complete application.
		 * @return
		 */
		public static function get applicationStateMachineXML():XML
		{
			return generateFSM(
					APPLICATION_BOOTSTRAP,
					BOOTSTRAP_COMPLETE,
					BOOTSTRAP_FAIL
			);
		}


		/**
		 * Returns a generated FSM.
		 * @param stateDefs
		 * @return
		 */
		private static function generateFSM(...stateDefs):XML
		{
			var fsm:XML = <fsm initial={STARTUP_INITIALISING}></fsm>;
			for each(var stateDef:XML in stateDefs) {
				fsm.appendChild(stateDef.children());
			}
			return fsm;
		}
	}
}
