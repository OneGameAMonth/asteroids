/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{

	import flash.display.Bitmap;

	import starling.animation.Transitions;

	import starling.animation.Tween;
	import starling.core.Starling;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	public class MainMenuView extends Sprite
	{
		[Embed(source="/../../main/resources/images/logo.png")]
		private static const LogoTexture:Class;

		public var playButton:Button;
		public var instructionsButton:Button;

		private var _container:Sprite;

		private var _logoImg:Image;

		private var _tween:Tween;

		/**
		 * Constructor
		 */
		public function MainMenuView()
		{
			super();

			this.visible = false;
			this.alpha = 0;

			var bmp:Bitmap = new LogoTexture();

			_logoImg = new Image(Texture.fromBitmap(bmp));
			addChild(_logoImg);

			_container = new Sprite();

			playButton = new Button(Texture.empty(270, 50, 0xFFFFFF), "PLAY");
			playButton.fontName = "Edit Undo Line";
			playButton.fontSize = 40;
			playButton.fontColor = 0x05BA8B;
			playButton.useHandCursor = true;
			_container.addChild(playButton);

			instructionsButton = new Button(Texture.empty(270, 50, 0xFFFFFF), "INSTRUCTIONS");
			instructionsButton.fontName = "Edit Undo Line";
			instructionsButton.fontSize = 40;
			instructionsButton.y = 70;
			instructionsButton.fontColor = 0x05BA8B;
			instructionsButton.useHandCursor = true;
			_container.addChild(instructionsButton);

			addChild(_container);

			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}


		private function init(event:Event):void
		{
			_logoImg.x = (stage.stageWidth - _logoImg.width)*.5;
			_logoImg.y = 40;

			_container.x = (stage.stageWidth - _container.width)*.5;
			_container.y = (stage.stageHeight - _container.height)*.5 + 40;
		}


		public function show():void
		{
			this.visible = true;

			_tween = new Tween(this, 1)
			_tween.fadeTo(1);
			Starling.juggler.add(_tween);
		}


		private function dispatchShown():void
		{

		}


		public function hide():void
		{
			_tween = new Tween(this, 1)
			_tween.fadeTo(0);
			_tween.onComplete = dispatchHidden;
			Starling.juggler.add(_tween);
		}


		private function dispatchHidden():void
		{
			this.visible = false;
			dispatchEvent(new Event("mainMenuHidden"));
		}
	}
}
