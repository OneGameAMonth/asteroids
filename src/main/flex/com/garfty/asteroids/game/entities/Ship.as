/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 02/11/2012
 * Time: 20:24
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.entities
{

	import com.fiber.core.Entity;
	import com.fiber.core.IEntity;
	import com.fiber.core.components.BodyComponent;
	import com.fiber.core.components.HealthComponent;
	import com.fiber.core.components.ParticleComponent;
	import com.fiber.core.components.PhysicsComponent;
	import com.fiber.core.components.TeleportComponent;
	import com.fiber.core.components.ViewComponent;
	import com.garfty.asteroids.gamepad.Gamepad;
	import com.garfty.asteroids.gamepad.KeyCode;

	import flash.display.Bitmap;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Timer;

	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class Ship extends Entity
	{
		[Embed(source="/../../main/resources/particles/ship-thrust-particle.pex", mimeType="application/octet-stream")]
		private static const ThrusterConfig:Class;

		[Embed(source="/../../main/resources/particles/ship-thrust-texture.png")]
		private static const ThrusterParticleTexture:Class;

		[Embed(source="/../../main/resources/images/ship.png")]
		private static const ShipTexture:Class;

		[Embed(source='/../../main/resources/audio/thruster.mp3')]
		private static const ThrusterSound:Class;

		[Embed(source='/../../main/resources/audio/explosion.mp3')]
		private static const ExplosionSound:Class;

		private var _gamepad:Gamepad;

		private var _blinkCount:Number = 10;

		private var _blinkDuration:Number = 300;

		private var _blinkTimer:Timer;

		public var _thrusterSound:Sound;
		public var _thrusterSoundChannel:SoundChannel;

		public var _explosionSound:Sound;
		public var _explosionSoundChannel:SoundChannel;
		
		public var _audioLoopTimer:Timer;

		/**
		 * Constructor
		 */
		public function Ship()
		{
			var thrusterConfig:XML = XML(new ThrusterConfig());
			var thrusterTexture:Texture = Texture.fromBitmap(new ThrusterParticleTexture());

			_thrusterSoundChannel = new SoundChannel();
			_thrusterSound = new ThrusterSound();

			_explosionSoundChannel = new SoundChannel();
			_explosionSound = new ExplosionSound();

			_audioLoopTimer = new Timer(_thrusterSound.length - 110, 1);

			var bmp:Bitmap = new ShipTexture();

			var img:Image = new Image(Texture.fromBitmap(bmp));
			img.x = -13;
			img.y = -18;

			// Adds the body component to the ship, and sets the initial placement.
			body = new BodyComponent(this);
			body.invincible = true;
			body.x = (Starling.current.stage.stageWidth - body.radius)*.5;
			body.y = (Starling.current.stage.stageHeight - body.radius)*.5;

			// Adds the physics component to the ship, applying a friction value.
			physics = new PhysicsComponent(this);
			physics.friction = 0.9;

			// Adds the view component to the ship, and attaches a Starling Sprite for rendering.
			view = new ViewComponent(this);
			view.stageWrap = true;
			view.container = new Sprite();
			view.container.addChild(img);

			// Adds a health component to the ship, and applies the default values.
			health = new HealthComponent(this);
			health.maxHealth = health.hits = 1;
			health.entityDieSignal.add(onShipDeath);

			// Adds a weapon component to the ship, so we can deal some damage.
			weapon = new Gun(this);

			// Adds a teleport component so the ship can teleport around the stage
			teleport = new TeleportComponent(this);
			teleport.maxTeleports = teleport.teleportCount = 3;

			// Add iain lobbs gamepad library for firing main weapon
			_gamepad = new Gamepad(Starling.current.nativeStage, false);
			_gamepad.fire1.mapKey(KeyCode.SPACEBAR);
			_gamepad.fire2.mapKey(KeyCode.SHIFT);

			// Adds appropriate particles to ship
			particles = new ParticleComponent(this);
			particles.addParticles(thrusterConfig, thrusterTexture);
			particles.emitterY = -23;

			// Add an invincibility to the ship when it is generated
			_blinkTimer = new Timer(_blinkDuration, _blinkCount);
			_blinkTimer.addEventListener(TimerEvent.TIMER, handleShipBlink);
			_blinkTimer.start();
		}


		private function onLoopAudioTimerComplete(event:TimerEvent):void
		{
			_audioLoopTimer.start();
			_thrusterSoundChannel = _thrusterSound.play();
		}


		private function handleShipBlink(event:TimerEvent):void
		{
			if (view.alpha == .25) {
				view.alpha = 1;
			}
			else {
				view.alpha = .25;
			}

			if (_blinkTimer.currentCount == _blinkCount) {
				body.invincible = false;
			}
		}


		override public function update():void
		{
			super.update();

			body.angle += _gamepad.x*0.1;
			physics.accelerateForward(-_gamepad.y);

			if (_gamepad.up.isPressed) {
				_audioLoopTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onLoopAudioTimerComplete);
				_audioLoopTimer.start();
				particles.startParticleEmitter();
			}

			if (_gamepad.up.isReleased) {
				_audioLoopTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onLoopAudioTimerComplete);
				_audioLoopTimer.stop();
				_thrusterSoundChannel.stop();
				particles.stopParticleEmitter();
			}

			if (_gamepad.fire1.isPressed) {
				weapon.fire();
			}

			// Teleport the player to another location, this should be restricted,
			// so the player can't just teleport all of the time.
			if (_gamepad.fire2.isPressed) {
				teleport.engageTeleport();
			}
		}


		protected function onShipDeath(entity:IEntity):void
		{
			_audioLoopTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onLoopAudioTimerComplete);
			_audioLoopTimer.stop();
			_thrusterSoundChannel.stop();

			_explosionSoundChannel = _explosionSound.play();

			body.invincible = true;
			destroy();
		}
	}
}
