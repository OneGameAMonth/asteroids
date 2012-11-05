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

	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class Gun extends WeaponComponent
	{
		[Embed(source='/../../main/resources/audio/ship-fire.mp3')]
		private static const WeaponFireSound:Class;

		public var _weaponFireSound:Sound;
		public var _weaponFireSoundChannel:SoundChannel;


		public function Gun(entity:IEntity)
		{
			_weaponFireSoundChannel = new SoundChannel();
			_weaponFireSound = new WeaponFireSound();

			super(entity);
		}


		override public function fire():void
		{
			if (ammoCount <= 0) {
				return;
			}

			var bullet:Bullet = new Bullet();
			bullet.targets = entity.targets;
			bullet.body.x = entity.body.x;
			bullet.body.y = entity.body.y;
			bullet.body.angle = entity.body.angle;
			bullet.physics.accelerateForward(8);

			entity.createdSignal.dispatch(bullet);

			_weaponFireSoundChannel = _weaponFireSound.play();

			ammoCount--;
			weaponFiredSignal.dispatch(entity);
		}
	}
}
