/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 16:34
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.entities.pickups
{

	import com.fiber.core.IEntity;

	public class TeleportPickUp extends PickUpBase
	{
		[Embed(source="/../resources/images/teleport.png")]
		private static const TeleportTexture:Class;

		private var _teleportCount:int = 1;


		public function TeleportPickUp()
		{
			_bmp = new TeleportTexture();
			super();
		}


		override public function update():void
		{
			super.update();

			for each(var target:IEntity in targets) {
				if (body.handleCollisionDetection(target) && target.teleport) {
					target.teleport.receiveTeleports(_teleportCount);
					destroy();
					return;
				}
			}
		}
	}
}
