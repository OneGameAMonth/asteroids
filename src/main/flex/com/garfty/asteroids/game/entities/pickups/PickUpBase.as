/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 18:40
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.entities.pickups
{

	import com.fiber.core.Entity;
	import com.fiber.core.components.BodyComponent;
	import com.fiber.core.components.PhysicsComponent;
	import com.fiber.core.components.ViewComponent;

	import flash.display.Bitmap;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class PickUpBase extends Entity
	{
		protected var _bmp:Bitmap;

		protected var _img:Image;

		private var _duration:Number = 10000;

		private var _durationTimer:Timer;


		public function PickUpBase()
		{
			_img = new Image(Texture.fromBitmap(_bmp));
			_img.x = _bmp.width*.5;
			_img.y = _bmp.height*.5;

			body = new BodyComponent(this);
			body.radius = 30;
			body.x = Math.random()*Starling.current.stage.stageWidth;
			body.y = Math.random()*Starling.current.stage.stageHeight;

			physics = new PhysicsComponent(this);
			physics.velocityX = (Math.random()*5) - 2;
			physics.velocityY = (Math.random()*5) - 2;

			view = new ViewComponent(this);
			view.stageWrap = true;
			view.container = new Sprite();
			view.container.addChild(_img);

			// Adds a timer on the ammo pack to discard after a certain amount of time
			_durationTimer = new Timer(_duration, 1);
			_durationTimer.addEventListener(TimerEvent.TIMER_COMPLETE, handleDurationTimerComplete)
			_durationTimer.start();
		}


		protected function handleDurationTimerComplete(event:TimerEvent):void
		{
			_durationTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, handleDurationTimerComplete);
			destroy();
		}
	}
}
