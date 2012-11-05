/**
 * User: Ken
 * Date: 05/11/2012
 */
package com.garfty.asteroids.sound.commands
{
	import com.garfty.asteroids.sound.BackgroundMusic;

	import flash.media.Sound;
	import flash.media.SoundChannel;

	import org.robotlegs.mvcs.StarlingSignalCommand;

	public class PlayBackgroundMusicCommand extends StarlingSignalCommand
	{
		private var _soundChannel:SoundChannel;

		public function PlayBackgroundMusicCommand()
		{
			super();
		}


		override public function execute():void
		{
			_soundChannel = new SoundChannel();
			_soundChannel = BackgroundMusic.sound.play(0, 100);
		}
	}
}
