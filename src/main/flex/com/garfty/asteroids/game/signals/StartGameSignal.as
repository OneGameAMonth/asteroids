/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.game.signals
{

  import org.osflash.signals.Signal;

  public class StartGameSignal extends Signal
  {
    public function StartGameSignal()
    {
      super(String);
    }
  }
}
