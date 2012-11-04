/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 12:49
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.entities
{

  import com.fiber.core.IEntity;
  import com.fiber.core.components.WeaponComponent;

  public class Gun extends WeaponComponent
  {
    public function Gun(entity:IEntity)
    {
      super(entity);
    }


    override public function fire():void
    {
      if(ammoCount <= 0){
        return;
      }

      var bullet:Bullet = new Bullet();
      bullet.targets = entity.targets;
      bullet.body.x = entity.body.x;
      bullet.body.y = entity.body.y;
      bullet.body.angle = entity.body.angle;
      bullet.physics.accelerateForward(10);

      entity.createdSignal.dispatch(bullet);

      ammoCount--;
      weaponFiredSignal.dispatch(entity);
    }
  }
}
