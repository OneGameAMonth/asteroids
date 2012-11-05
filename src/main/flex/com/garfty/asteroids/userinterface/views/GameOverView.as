/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 13:16
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

	import flash.display.Bitmap;

	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class GameOverView extends Sprite
	{
		public var restartGameButton:Button;

		public var mainMenuButton:Button;
		
		private var _buttonsContainer:Sprite;


		public function GameOverView()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);

			_buttonsContainer = new Sprite();
			addChild(_buttonsContainer)

			restartGameButton = new Button(Texture.empty(230, 50, 0xFFFFFF), "RESTART");
			restartGameButton.fontName = "Edit Undo Line";
			restartGameButton.fontSize = 40;
			restartGameButton.fontColor = 0x05BA8B;
			restartGameButton.useHandCursor = true;
			_buttonsContainer.addChild(restartGameButton);

			mainMenuButton = new Button(Texture.empty(230, 50, 0xFFFFFF), "MAIN MENU");
			mainMenuButton.fontName = "Edit Undo Line";
			mainMenuButton.fontSize = 40;
			mainMenuButton.y = 60;
			mainMenuButton.fontColor = 0x05BA8B;
			mainMenuButton.useHandCursor = true;
			_buttonsContainer.addChild(mainMenuButton);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			_buttonsContainer.x = (stage.stageWidth - _buttonsContainer.width) * .5;
			_buttonsContainer.y = (stage.stageHeight - _buttonsContainer.height) - 30;
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
