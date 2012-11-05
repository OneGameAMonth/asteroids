/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 17:07
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	public class HudView extends Sprite
	{
		public var scoreLabel:TextField = new TextField(300, 35, "", "Edit Undo Line", 28, 0x05BA8B);
		public var livesLabel:TextField = new TextField(300, 35, "", "Edit Undo Line", 28, 0xDD0048);
		public var ammoLabel:TextField = new TextField(300, 35, "", "Edit Undo Line", 28, 0xE56105);
		public var teleportsLabel:TextField = new TextField(300, 35, "", "Edit Undo Line", 28, 0xFBF002);


		public function HudView()
		{
			this.visible = false;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			scoreLabel.x = 20;
			scoreLabel.y = 15;
			scoreLabel.hAlign = "left";
			addChild(scoreLabel);

			livesLabel.x = (stage.stageWidth - livesLabel.width) - 20;
			livesLabel.hAlign = "right";
			livesLabel.y = 15;
			addChild(livesLabel);

			ammoLabel.x = (stage.stageWidth - ammoLabel.width) - 20;
			ammoLabel.hAlign = "right";
			ammoLabel.y = 50;
			addChild(ammoLabel);

			teleportsLabel.x = (stage.stageWidth - ammoLabel.width) - 20;
			teleportsLabel.hAlign = "right";
			teleportsLabel.y = 85;
			addChild(teleportsLabel);
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
