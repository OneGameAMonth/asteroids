/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 03/11/2012
 * Time: 13:55
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.game.models
{

  import com.fiber.core.IEntity;
  import com.garfty.asteroids.game.entities.pickups.AmmoPickUp;
  import com.garfty.asteroids.game.entities.pickups.HealthPickUp;
  import com.garfty.asteroids.game.entities.pickups.TeleportPickUp;
  import com.garfty.asteroids.game.models.constants.GameDifficultyConstants;

  import org.robotlegs.mvcs.Actor;

  public class GameModel extends Actor implements IGameModel
  {
    private var _maxLives:int;

    private var _score:int;

    private var _lives:int;

    private var _level:int;

    private var _gameOver:Boolean;

    private var _difficulty:String;

    private var _asteroidCount:Vector.<int>;

    private var _players:Vector.<IEntity> = new Vector.<IEntity>();

    private var _enemies:Vector.<IEntity> = new Vector.<IEntity>();

    private var _collectables:Vector.<IEntity> = new Vector.<IEntity>();

    private var _pickups:Vector.<Class> = new <Class>[AmmoPickUp, TeleportPickUp, HealthPickUp];


    /**
     * Constructor
     */
    public function GameModel()
    {
      maxLives = 3;
      score = 0;
      lives = maxLives;
      level = 1;
      difficulty = GameDifficultyConstants.INSANE;

      super();
    }


    /**
     * @inheritDoc
     */
    public function incrementScore(value:int):void
    {
      score += value;
    }


    /**
     * @inheritDoc
     */
    public function decrementScore(value:int):void
    {
      score -= value;
    }


    /**
     * @inheritDoc
     */
    public function incrementLives(value:int):void
    {
      lives += value;

      if (lives < maxLives) {
        lives = maxLives;
      }
    }


    /**
     * @inheritDoc
     */
    public function decrementLives(value:int):void
    {
      lives -= value;
    }


    /**
     * @inheritDoc
     */
    public function get maxLives():int
    {
      return _maxLives;
    }


    /**
     * @inheritDoc
     */
    public function set maxLives(value:int):void
    {
      _maxLives = value;
    }


    /**
     * @inheritDoc
     */
    public function get score():int
    {
      return _score;
    }


    /**
     * @inheritDoc
     */
    public function set score(value:int):void
    {
      _score = value;
    }


    /**
     * @inheritDoc
     */
    public function get lives():int
    {
      return _lives;
    }


    /**
     * @inheritDoc
     */
    public function set lives(value:int):void
    {
      _lives = value;
    }


    /**
     * @inheritDoc
     */
    public function get level():int
    {
      return _level;
    }


    /**
     * @inheritDoc
     */
    public function set level(value:int):void
    {
      _level = value;
    }


    /**
     * @inheritDoc
     */
    public function get asteroidCount():Vector.<int>
    {
      switch(difficulty){
        case GameDifficultyConstants.EASY:
          _asteroidCount = new <int>[1, 3, 5, 7];
          break;
        case GameDifficultyConstants.MEDIUM:
          _asteroidCount = new <int>[2, 4, 6, 8];
          break;
        case GameDifficultyConstants.HARD:
          _asteroidCount = new <int>[3, 7, 10, 13];
          break;
        case GameDifficultyConstants.INSANE:
          _asteroidCount = new <int>[5, 10, 15, 20];
          break;
      }

      return _asteroidCount;
    }


    /**
     * @inheritDoc
     */
    public function set asteroidCount(value:Vector.<int>):void
    {
      _asteroidCount = value;
    }


    /**
     * @inheritDoc
     */
    public function get gameOver():Boolean
    {
      return _gameOver;
    }


    /**
     * @inheritDoc
     */
    public function set gameOver(value:Boolean):void
    {
      _gameOver = value;
    }


    /**
     * @inheritDoc
     */
    public function get difficulty():String
    {
      return _difficulty;
    }


    /**
     * @inheritDoc
     */
    public function set difficulty(value:String):void
    {
      _difficulty = value;
    }


    /**
     * @inheritDoc
     */
    public function get players():Vector.<IEntity>
    {
      return _players;
    }


    /**
     * @inheritDoc
     */
    public function get enemies():Vector.<IEntity>
    {
      return _enemies;
    }


    /**
     * @inheritDoc
     */
    public function get collectables():Vector.<IEntity>
    {
      return _collectables;
    }


    /**
     * @inheritDoc
     */
    public function get pickups():Vector.<Class>
    {
      return _pickups;
    }
  }
}
