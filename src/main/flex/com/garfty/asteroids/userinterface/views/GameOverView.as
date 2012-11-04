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
    [Embed(source="/../../main/resources/images/texture.png")]
    private static const ButtonTexture:Class;

    public var gameOverLabel:TextField;

    public var restartGameButton:Button;

    public var mainMenuButton:Button;

    public function GameOverView()
    {
      this.addEventListener(Event.ADDED_TO_STAGE, init);

      gameOverLabel = new TextField(300, 20, "GAME OVER!", "Verdana", 12, 0xFFFFFF);
      addChild(gameOverLabel);

      var buttonSkin:Bitmap = new ButtonTexture();
      var texture:Texture = Texture.fromBitmap(buttonSkin);

      restartGameButton = new Button(texture, "Restart?");
      addChild(restartGameButton);

      mainMenuButton = new Button(texture, "Main Menu");
      addChild(mainMenuButton);
    }


    private function init(event:Event):void
    {
      this.removeEventListener(Event.ADDED_TO_STAGE, init);

      gameOverLabel.x = (stage.stageWidth - gameOverLabel.width) * .5;
      gameOverLabel.y = (stage.stageHeight - gameOverLabel.height) * .5 - 30;

      restartGameButton.x = (stage.stageWidth - restartGameButton.width) * .5;
      restartGameButton.y = (stage.stageHeight - restartGameButton.height) * .5 + 30;

      mainMenuButton.x = (stage.stageWidth - mainMenuButton.width) * .5;
      mainMenuButton.y = (stage.stageHeight - mainMenuButton.height) * .5 + 100;
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
