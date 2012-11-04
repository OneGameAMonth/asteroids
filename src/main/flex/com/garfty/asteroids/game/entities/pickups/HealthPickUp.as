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

  import flash.utils.Timer;

  public class HealthPickUp extends PickUpBase
  {
    [Embed(source="/../resources/images/health.png")]
    private static const HealthTexture:Class;

    private var _health:int = 1;

    public function HealthPickUp()
    {
      _bmp = new HealthTexture();
      super();
    }

    override public function update():void
    {
      super.update();

      for each(var target:IEntity in targets) {
        if (body.handleCollisionDetection(target) && target.health) {
          target.health.receiveHealth(_health);
          destroy();
          return;
        }
      }
    }
  }
}
