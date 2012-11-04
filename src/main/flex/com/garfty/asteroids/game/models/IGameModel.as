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

  public interface IGameModel
  {

    /**
     * Increments the players score.
     * @param value
     */
    function incrementScore(value:int):void;


    /**
     * Decrements the players score.
     * @param value
     */
    function decrementScore(value:int):void;


    /**
     * Increments the players lives
     * @param value
     */
    function incrementLives(value:int):void;


    /**
     * Decrements the players lives.
     * @param value
     */
    function decrementLives(value:int):void;


    /**
     * Returns the max lives the player can have.
     */
    function get maxLives():int;


    /**
     * Sets the max lives the player can have.
     * @param value
     */
    function set maxLives(value:int):void;


    /**
     * Returns the players score.
     */
    function get score():int;


    /**
     * Sets the players score.
     * @param value
     */
    function set score(value:int):void;


    /**
     * Returns the players lives.
     */
    function get lives():int;


    /**
     * Sets the players lives.
     * @param value
     */
    function set lives(value:int):void;


    /**
     * Returns the players current level as a string.
     */
    function get level():int;


    /**
     * Returns the asteroid count dependent on level
     * the player is on
     */
    function get asteroidCount():Vector.<int>;


    /**
     * Sets the asteroid counts for the players levels.
     * @param value
     */
    function set asteroidCount(value:Vector.<int>):void;

    /**
     * Returns if the players game is over or not
     */
    function get gameOver():Boolean;


    /**
     * Sets if the players game is over or not.
     * @param value
     */
    function set gameOver(value:Boolean):void;


    /**
     * Sets the players current level.
     * @param value
     */
    function set level(value:int):void;


    /**
     * Returns the players difficulty, set via the level
     * constants class.
     */
    function get difficulty():String;


    /**
     * Sets the players current level difficulty.
     * @param value
     */
    function set difficulty(value:String):void;


    /**
     * Returns the game current players.
     */
    function get players():Vector.<IEntity>;


    /**
     * Returns the games current enemies.
     */
    function get enemies():Vector.<IEntity>;


    /**
     * Returns the games current collectables.
     */
    function get collectables():Vector.<IEntity>;


    /**
     * Returns the pickup classes
     */
    function get pickups():Vector.<Class>
  }
}
