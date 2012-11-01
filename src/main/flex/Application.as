package
{

	import com.garfty.asteroids.AsteroidsGame;

	import flash.display.Sprite;
	import flash.events.Event;

	import starling.core.Starling;

	[SWF(width="890", height="490", frameRate="60", backgroundColor="#000000")]
	public class Application extends Sprite
	{

		private var _starling:Starling;


		public function Application()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}


		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);

			_starling = new Starling(AsteroidsGame, stage);
			_starling.showStats = true;
			_starling.start();
		}
	}
}
