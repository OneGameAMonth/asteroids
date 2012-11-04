/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 12:50
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.entities
{

  import com.fiber.core.Entity;
  import com.fiber.core.IEntity;
  import com.fiber.core.components.BodyComponent;
  import com.fiber.core.components.PhysicsComponent;
  import com.fiber.core.components.ViewComponent;

  import flash.display.Bitmap;

  import starling.display.Image;
  import starling.display.Sprite;
  import starling.textures.Texture;

  public class Bullet extends Entity
  {
    [Embed(source="/../../main/resources/images/bullet.png")]
    private static const BulletTexture:Class;

    private var _lifeSpan:int = 30;

    private var _lifeTime:int = 0;


    /**
     * Constructor
     */
    public function Bullet()
    {
      var bmp:Bitmap = new BulletTexture();

      var img:Image = new Image(Texture.fromBitmap(bmp));
      img.x = img.y = -2.5;

      body = new BodyComponent(this);
      body.radius = 5;

      physics = new PhysicsComponent(this);

      view = new ViewComponent(this);
      view.stageWrap = true;
      view.container = new Sprite();
      view.container.addChild(img);
    }


    override public function update():void
    {
      super.update();

      // Check the collision of the bullet against other targets,
      // if the bullet collides with another target then the target
      // takes damage and the bullet should be destroyed.
      for each(var target:IEntity in targets) {
        if (body.handleCollisionDetection(target)) {
          target.health.receiveDamage(1);
          destroy();
          return;
        }
      }

      // Increment the life time value
      lifeTime++;

      // Check to see if the entity has exceeded its lifespan,
      // if it has then destroy it.
      if (lifeTime > lifeSpan) {
        destroy();
      }
    }


    public function get lifeSpan():int
    {
      return _lifeSpan;
    }


    public function set lifeSpan(value:int):void
    {
      _lifeSpan = value;
    }


    public function get lifeTime():int
    {
      return _lifeTime;
    }


    public function set lifeTime(value:int):void
    {
      _lifeTime = value;
    }
  }
}