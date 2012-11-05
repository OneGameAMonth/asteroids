/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{

	import flash.display.Bitmap;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class MainMenuView extends Sprite
	{
		[Embed(source="/../../main/resources/images/logo.png")]
		private static const LogoTexture:Class;

		public var backButton:Button;

		private var _instructionsText:TextField;

		public var welcomeContainer:Sprite;
		public var difficultyContainer:Sprite;
		public var instructionsContainer:Sprite;

		public var playButton:Button;
		public var instructionsButton:Button;

		public var easyButton:Button;
		public var mediumButton:Button;
		public var hardButton:Button;
		public var insaneButton:Button;

		private var _logoImg:Image;

		/**
		 * Constructor
		 */
		public function MainMenuView()
		{
			super();

			var bmp:Bitmap = new LogoTexture();

			_logoImg = new Image(Texture.fromBitmap(bmp));
			addChild(_logoImg);

			welcomeContainer = new Sprite();

			playButton = new Button(Texture.empty(270, 50, 0xFFFFFF),"PLAY");
			playButton.fontName = "Edit Undo Line";
			playButton.fontSize = 40;
			playButton.fontColor = 0x05BA8B;
			playButton.useHandCursor = true;
			welcomeContainer.addChild(playButton);

			instructionsButton = new Button(Texture.empty(270, 50, 0xFFFFFF),"INSTRUCTIONS");
			instructionsButton.fontName = "Edit Undo Line";
			instructionsButton.fontSize = 40;
			instructionsButton.y = 70;
			instructionsButton.fontColor = 0x05BA8B;
			instructionsButton.useHandCursor = true;
			welcomeContainer.addChild(instructionsButton);

			addChild(welcomeContainer);

			difficultyContainer = new Sprite();
			addChild(difficultyContainer);

			easyButton = new Button(Texture.empty(140, 50, 0xFFFFFF),"EASY");
			easyButton.fontName = "Edit Undo Line";
			easyButton.fontSize = 40;
			easyButton.fontColor = 0x05BA8B;
			easyButton.useHandCursor = true;
			difficultyContainer.addChild(easyButton);

			mediumButton = new Button(Texture.empty(140, 50, 0xFFFFFF),"MEDIUM");
			mediumButton.fontName = "Edit Undo Line";
			mediumButton.fontSize = 40;
			mediumButton.y = 60;
			mediumButton.fontColor = 0x05BA8B;
			mediumButton.useHandCursor = true;
			difficultyContainer.addChild(mediumButton);

			hardButton = new Button(Texture.empty(140, 50, 0xFFFFFF),"HARD");
			hardButton.fontName = "Edit Undo Line";
			hardButton.fontSize = 40;
			hardButton.y = 120;
			hardButton.fontColor = 0x05BA8B;
			hardButton.useHandCursor = true;
			difficultyContainer.addChild(hardButton);

			insaneButton = new Button(Texture.empty(140, 50, 0xFFFFFF),"INSANE");
			insaneButton.fontName = "Edit Undo Line";
			insaneButton.fontSize = 40;
			insaneButton.y = 180;
			insaneButton.fontColor = 0x05BA8B;
			insaneButton.useHandCursor = true;
			difficultyContainer.addChild(insaneButton);

			instructionsContainer = new Sprite();
			addChild(instructionsContainer);

			_instructionsText = new TextField(500, 250, "Welcome to Asteroids, the game where you have to defeat all of the asteroids before they smash in to you. This path is a long and daunting one for someone to take on, beware of your ammo and warps as they are not unlimited. Use the arrow keys to move around, space to shoot and shift to warp. Good luck cadette.", "Edit Undo Line", 22, 0x05BA8B )
			instructionsContainer.addChild(_instructionsText);


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
			_logoImg.x = (stage.stageWidth - _logoImg.width)*.5;
			_logoImg.y = 40;

			welcomeContainer.x = (stage.stageWidth - welcomeContainer.width)*.5;
			welcomeContainer.y = (stage.stageHeight - welcomeContainer.height)*.5 + 40;

			instructionsContainer.x = (stage.stageWidth - instructionsContainer.width)*.5;
			instructionsContainer.y = (stage.stageHeight - instructionsContainer.height)*.5 + 40;

			difficultyContainer.x = (stage.stageWidth - difficultyContainer.width)*.5;
			difficultyContainer.y = (stage.stageHeight - difficultyContainer.height)*.5 + 40;

			backButton.x = (stage.stageWidth - backButton.width)*.5;
			backButton.y = 410;
		}


		public function showWelcomeScreen():void
		{
			welcomeContainer.visible = true;
			instructionsContainer.visible = false;
			difficultyContainer.visible = false;

			backButton.visible = false;
		}


		public function showInstructionsScreen():void
		{
			welcomeContainer.visible = false;
			instructionsContainer.visible = true;
			difficultyContainer.visible = false;

			backButton.visible = true;
		}


		public function showDifficultyScreen():void
		{
			welcomeContainer.visible = false;
			instructionsContainer.visible = false;
			difficultyContainer.visible = true;

			backButton.visible = true;
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
