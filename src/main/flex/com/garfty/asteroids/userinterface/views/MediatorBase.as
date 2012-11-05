/**
 * User: Sagat
 * Date: 05/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import com.garfty.asteroids.logger.ILogger;

	import flash.media.Sound;
	import flash.media.SoundChannel;

	import org.robotlegs.mvcs.StarlingMediator;

	public class MediatorBase extends StarlingMediator
	{
		[Embed(source='/../../main/resources/audio/button-click.mp3')]
		private static const ButtonClickSound:Class;

		protected var _buttonClickSoundChannel:SoundChannel;
		protected var _buttonClickSound:Sound;

		[Inject]
		public var logger:ILogger;

		public function MediatorBase()
		{
			super();
		}


		override public function onRegister():void
		{
			super.onRegister();

			_buttonClickSoundChannel = new SoundChannel();
			_buttonClickSound = new ButtonClickSound();
		}
	}
}
