/**
 * User: Ken
 * Date: 05/11/2012
 */
package com.garfty.asteroids.sound
{
	import flash.media.Sound;

	public class BackgroundMusic
	{
		[Embed(source='/../../main/resources/audio/background-music.mp3')]
		private static const BackgroundMusicSound:Class;

		private static var backgroundMusicSound:Sound;

		public function BackgroundMusic()
		{
			super();
		}

		public static function get sound():Sound
		{
			backgroundMusicSound = new BackgroundMusicSound();
			return backgroundMusicSound;
		}
	}
}
