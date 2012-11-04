/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 20:57
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.signals
{

  import com.garfty.asteroids.game.models.vo.PlayerInfoVO;

  import org.osflash.signals.Signal;

  public class UpdatePlayerInfoSignal extends Signal
  {
    public function UpdatePlayerInfoSignal(...params)
    {
      super(PlayerInfoVO);
    }
  }
}
