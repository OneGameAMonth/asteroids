/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 20:59
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.models.vo
{

  public class PlayerInfoVO
  {
    public var score:int = 0;

    public var lives:int = 0;

    public var ammo:int = 0;

    public var teleports:int = 0;

    public function PlayerInfoVO(score:int, lives:int, ammo:int, teleports:int)
    {
      this.score = score;
      this.lives = lives;
      this.ammo = ammo;
      this.teleports = teleports;
    }
  }
}
