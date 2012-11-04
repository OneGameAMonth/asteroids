/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 04/11/2012
 * Time: 13:43
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

  import starling.display.Sprite;
  import starling.events.Event;

  public class GameCompleteView extends Sprite
  {
    public function GameCompleteView()
    {
      this.addEventListener(Event.ADDED_TO_STAGE, init);
    }


    private function init(event:Event):void
    {
      this.removeEventListener(Event.ADDED_TO_STAGE, init);
    }
  }
}
