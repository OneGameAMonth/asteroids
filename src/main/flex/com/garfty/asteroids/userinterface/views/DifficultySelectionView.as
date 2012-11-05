/**
 * User: Ken
 * Date: 05/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	public class DifficultySelectionView extends Sprite
	{
		public var backButton:Button;

		public var easyButton:Button;
		public var mediumButton:Button;
		public var hardButton:Button;
		public var insaneButton:Button;

		private var _container:Sprite;

		public function DifficultySelectionView()
		{
			super();

			this.visible = false;

			_container = new Sprite();
			addChild(_container);

			easyButton = new Button(Texture.empty(140, 50, 0xFFFFFF), "EASY");
			easyButton.fontName = "Edit Undo Line";
			easyButton.fontSize = 40;
			easyButton.fontColor = 0x05BA8B;
			easyButton.useHandCursor = true;
			_container.addChild(easyButton);

			mediumButton = new Button(Texture.empty(140, 50, 0xFFFFFF), "MEDIUM");
			mediumButton.fontName = "Edit Undo Line";
			mediumButton.fontSize = 40;
			mediumButton.y = 60;
			mediumButton.fontColor = 0x05BA8B;
			mediumButton.useHandCursor = true;
			_container.addChild(mediumButton);

			hardButton = new Button(Texture.empty(140, 50, 0xFFFFFF), "HARD");
			hardButton.fontName = "Edit Undo Line";
			hardButton.fontSize = 40;
			hardButton.y = 120;
			hardButton.fontColor = 0x05BA8B;
			hardButton.useHandCursor = true;
			_container.addChild(hardButton);

			insaneButton = new Button(Texture.empty(140, 50, 0xFFFFFF), "INSANE");
			insaneButton.fontName = "Edit Undo Line";
			insaneButton.fontSize = 40;
			insaneButton.y = 180;
			insaneButton.fontColor = 0x05BA8B;
			insaneButton.useHandCursor = true;
			_container.addChild(insaneButton);

			backButton = new Button(Texture.empty(140, 50, 0xFFFFFF), "BACK");
			backButton.fontName = "Edit Undo Line";
			backButton.fontColor = 0xE00278;
			backButton.fontSize = 40;
			backButton.y = 240;
			backButton.useHandCursor = true;
			_container.addChild(backButton);

			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			_container.x = (stage.stageWidth - _container.width)*.5;
			_container.y = (stage.stageHeight - _container.height) - 40;
		}


		public function show():void
		{
			this.visible = true;
		}


		public function hide():void
		{
			this.visible = false;
		}
	}
}
