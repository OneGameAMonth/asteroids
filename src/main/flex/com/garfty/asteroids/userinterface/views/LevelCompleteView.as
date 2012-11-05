/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 13:45
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

	import flash.display.Bitmap;

	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	public class LevelCompleteView extends Sprite
	{
		[Embed(source="/../../main/resources/images/texture.png")]
		private static const ButtonTexture:Class;

		public var continueButton:Button;


		public function LevelCompleteView()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);

			var buttonSkin:Bitmap = new ButtonTexture();
			var texture:Texture = Texture.fromBitmap(buttonSkin);

			this.addEventListener(Event.ADDED_TO_STAGE, init);

			continueButton = new Button(texture, "Play!");
			continueButton.useHandCursor = true;
			addChild(continueButton);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			continueButton.x = (stage.stageWidth - continueButton.width)*.5;
			continueButton.y = (stage.stageHeight - continueButton.height)*.5;
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
