/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 17:07
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.userinterface.views
{

  import com.garfty.asteroids.game.models.vo.PlayerInfoVO;
  import com.garfty.asteroids.game.signals.UpdatePlayerInfoSignal;
  import com.garfty.asteroids.userinterface.signals.DisplayGameHudSignal;
  import com.garfty.asteroids.userinterface.signals.HideGameHudSignal;

  import org.robotlegs.mvcs.StarlingMediator;

  public class HudMediator extends StarlingMediator
  {
    [Inject]
    public var view:HudView;

    [Inject]
    public var updatePlayerInfoSignal:UpdatePlayerInfoSignal;

    [Inject]
    public var displayGameHudSignal:DisplayGameHudSignal;

    [Inject]
    public var hideGameHudSignal:HideGameHudSignal;

    public function HudMediator()
    {
      super();
    }


    override public function onRegister():void
    {
      updatePlayerInfoSignal.add(handlePlayerInfoUpdate);

      view.hide();

      displayGameHudSignal.add(onDisplayGameHud);
      hideGameHudSignal.add(onHideGameHud);
    }


    private function onDisplayGameHud():void
    {
      view.show();
    }


    private function onHideGameHud():void
    {
      view.hide();
    }


    private function handlePlayerInfoUpdate(info:PlayerInfoVO):void
    {
      view.livesLabel.text = "Lives: " + info.lives;
      view.scoreLabel.text = "Score: " + info.score;
      view.ammoLabel.text = "Ammo: " + info.ammo;
      view.teleportsLabel.text = "Teleports: " + info.teleports;
    }
  }
}
