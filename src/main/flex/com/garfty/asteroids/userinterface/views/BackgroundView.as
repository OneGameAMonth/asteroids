/**
 * User: Sagat
 * Date: 05/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import flash.display.Bitmap;

	import starling.display.Image;

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	public class BackgroundView extends Sprite
	{
		[Embed(source="/../../main/resources/images/background.png")]
		private static const BackgroundTexture:Class;

		private var _bmp:Bitmap;
		private var _image:Image;

		public function BackgroundView()
		{
			super();

			this.addEventListener(Event.ADDED_TO_STAGE, init);

			_bmp = new BackgroundTexture();
			_image = new Image(Texture.fromBitmap(_bmp));

			addChild(_image);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
}
