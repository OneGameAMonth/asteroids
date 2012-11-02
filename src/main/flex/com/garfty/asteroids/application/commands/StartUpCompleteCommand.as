/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.application.commands
{
	import com.fiber.core.utils.EntityManager;
	import com.fiber.core.utils.IEntityManager;
	import com.garfty.asteroids.logger.ILogger;
	import com.garfty.asteroids.userinterface.views.WelcomeScreenMediator;
	import com.garfty.asteroids.userinterface.views.WelcomeScreenView;

	import org.robotlegs.mvcs.StarlingCommand;

	public class StartUpCompleteCommand extends StarlingCommand
	{
		[Inject]
		public var logger:ILogger;

		public function StartUpCompleteCommand()
		{
			super();
		}


		override public function execute():void
		{
			logger.info("Asteroids Application Start Up Complete");

			injector.mapSingletonOf(EntityManager, IEntityManager);

			mediatorMap.mapView( WelcomeScreenView, WelcomeScreenMediator );
			contextView.addChild(new WelcomeScreenView());
		}
	}
}
