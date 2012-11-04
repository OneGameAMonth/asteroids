/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.application.models
{

  public interface IEnvironmentModel
  {
    /**
     * Returns the FlashVars
     * @return
     */
    function get flashVars():Object;


    /**
     * Sets the value of the FlashVars Object
     * @param value
     */
    function set flashVars(value:Object):void;


    /**
     * Returns the AssetPath value
     * @return
     */
    function get assetPath():String;


    /**
     * Sets the AssetPath value
     * @param value
     */
    function set assetPath(value:String):void;


    /**
     * Returns the ServicePath value
     * @return
     */
    function get servicePath():String;


    /**
     * Sets the ServicePath value
     * @param value
     */
    function set servicePath(value:String):void;


    /**
     * Returns the SWFPath value
     * @return
     */
    function get swfPath():String;


    /**
     * Sets the SWFPath value
     * @param value
     */
    function set swfPath(value:String):void;


    /**
     * Returns the value of the required FlashVar, if the errorIfUndefined
     * variable is true, a flash error is thrown.
     *
     * @param variableName
     * @param errorIfUndefined
     * @return
     */
    function getFlashVar(variableName:String, errorIfUndefined:Boolean = true):String;
  }
}
