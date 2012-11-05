/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 13:45
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	public class LevelCompleteView extends Sprite
	{
		public var continueButton:Button;


		public function LevelCompleteView()
		{
			this.visible = false;

			continueButton = new Button(Texture.empty(150, 50, 0xFFFFFF), "CONTINUE");
			continueButton.fontName = "Edit Undo Line";
			continueButton.fontSize = 40;
			continueButton.y = 60;
			continueButton.fontColor = 0xE00278;
			continueButton.useHandCursor = true;
			addChild(continueButton);

			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			continueButton.x = (stage.stageWidth - continueButton.width)*.5;
			continueButton.y = 410;
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
