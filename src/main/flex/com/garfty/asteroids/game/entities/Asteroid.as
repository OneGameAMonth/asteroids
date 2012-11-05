/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 13:23
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.entities
{

	import com.fiber.core.Entity;
	import com.fiber.core.IEntity;
	import com.fiber.core.components.BodyComponent;
	import com.fiber.core.components.HealthComponent;
	import com.fiber.core.components.PhysicsComponent;
	import com.fiber.core.components.ViewComponent;

	import flash.display.Bitmap;

	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class Asteroid extends Entity
	{
		[Embed(source="/../../main/resources/images/asteroid.png")]
		private static const AsteroidTexture:Class;


		public function Asteroid()
		{
			var bmp:Bitmap = new AsteroidTexture();

			var img:Image = new Image(Texture.fromBitmap(bmp));
			img.x = -23
			img.y = -23;

			body = new BodyComponent(this);
			body.radius = 46;
			body.x = Math.random()*Starling.current.stage.stageWidth;
			body.y = Math.random()*Starling.current.stage.stageHeight;

			physics = new PhysicsComponent(this);
			physics.velocityX = (Math.random()*5) - 2;
			physics.velocityY = (Math.random()*5) - 2;

			health = new HealthComponent(this);
			health.hits = 3;
			health.entityDamageSignal.add(takeDamage);

			view = new ViewComponent(this);
			view.stageWrap = true;
			view.container = new Sprite();
			view.container.addChild(img);
		}


		override public function update():void
		{
			super.update();

			for each(var target:IEntity in targets) {
				if (body.handleCollisionDetection(target)) {
					target.health.receiveDamage(1);
					takeDamage(target);
					return;
				}
			}
		}


		protected function takeDamage(entity:IEntity):void
		{
			// Dispatch the asteroid destroyed
			destroy();
		}
	}
}