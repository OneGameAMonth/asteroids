/**
 * User: Sagat
 * Date: 02/11/2012
 */
package com.garfty.asteroids.userinterface.views
{

  import flash.display.Bitmap;

  import starling.display.Button;
  import starling.display.Sprite;
  import starling.events.Event;
  import starling.textures.Texture;

  public class MainMenuView extends Sprite
  {
    [Embed(source="/../../main/resources/images/texture.png")]
    private static const ButtonTexture:Class;


    public var playButton:Button;


    /**
     * Constructor
     */
    public function MainMenuView()
    {
      super();

      var buttonSkin:Bitmap = new ButtonTexture();
      var texture:Texture = Texture.fromBitmap(buttonSkin);

      this.addEventListener(Event.ADDED_TO_STAGE, init);

      playButton = new Button(texture, "Play!");
      playButton.useHandCursor = true;
      addChild(playButton);
    }


    private function init(event:Event):void
    {
      playButton.x = (stage.stageWidth - playButton.width) * .5;
      playButton.y = (stage.stageHeight - playButton.height) * .5;
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
