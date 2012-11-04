/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 31/10/2012
 * Time: 22:05
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids
{

  import org.robotlegs.mvcs.StarlingSignalContext;

  import starling.display.Sprite;

  public class AsteroidsGame extends Sprite
  {
    private var _starlingContext:StarlingSignalContext;


    public function AsteroidsGame()
    {
      super();
      _starlingContext = new AsteroidsContext(this);
    }
  }
}
