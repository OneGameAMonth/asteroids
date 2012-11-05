/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.game.signals
{

	import com.garfty.asteroids.game.models.vo.PlayerInfoVO;

	import org.osflash.signals.Signal;

	public class GameOverSignal extends Signal
	{
		public function GameOverSignal()
		{
			super(PlayerInfoVO);
		}
	}
}
