/**
 * User: Ken
 * Date: 05/11/2012
 */
package com.garfty.asteroids.userinterface.views
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class InstructionsView extends Sprite
	{
		public var backButton:Button;

		private var _container:Sprite;
		private var _instructionsText:TextField;


		public function InstructionsView()
		{
			super();

			this.visible = false;

			_container = new Sprite();
			addChild(_container);

			_instructionsText = new TextField(500, 250, "Welcome to Asteroids, the game where you have to defeat all of the asteroids before they smash in to you. This path is a long and daunting one for someone to take on, beware of your ammo and warps as they are not unlimited. Use the arrow keys to move around, space to shoot and shift to warp. Good luck cadette.", "Edit Undo Line", 22, 0x05BA8B)
			_container.addChild(_instructionsText);

			backButton = new Button(Texture.empty(100, 50, 0xFFFFFF), "BACK");
			backButton.fontName = "Edit Undo Line";
			backButton.fontColor = 0xE00278;
			backButton.fontSize = 40;
			backButton.useHandCursor = true;
			addChild(backButton);

			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			_container.x = (stage.stageWidth - _container.width)*.5;
			_container.y = (stage.stageHeight - _container.height)*.5 + 30;

			backButton.x = (stage.stageWidth - backButton.width)*.5;
			backButton.y = 410;
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
