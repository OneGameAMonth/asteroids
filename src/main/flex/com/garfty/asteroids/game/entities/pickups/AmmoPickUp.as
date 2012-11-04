/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 16:33
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.entities.pickups
{

  import com.fiber.core.IEntity;

  public class AmmoPickUp extends PickUpBase
  {
    [Embed(source="/../resources/images/ammo.png")]
    private static const AmmoTexture:Class;

    private var _ammoCount:int = 10;

    public function AmmoPickUp()
    {
      _bmp = new AmmoTexture();
      super();
    }


    override public function update():void
    {
      super.update();

      for each(var target:IEntity in targets) {
        if (body.handleCollisionDetection(target) && target.weapon) {
          target.weapon.receiveAmmo(_ammoCount);
          destroy();
          return;
        }
      }
    }
  }
}
