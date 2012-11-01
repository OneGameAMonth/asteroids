/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 31/10/2012
 * Time: 22:25
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.logger
{

  import flash.events.EventDispatcher;

  public class BasicLogger extends EventDispatcher implements ILogger
  {
    public function BasicLogger()
    {
      super();
    }

    public function log(level:LogLevelEnum, message:String, ...rest):void
    {
      var fullMessage:Array = ['[' + level.name + '] ' + message].concat(rest);
      trace.apply(this, fullMessage);
    }


    public function debug(message:String, ...rest):void
    {

    }


    public function error(message:String, ...rest):void
    {
      log(LogLevelEnum.ERROR, stringifyArguments(message, rest));
    }


    public function fatal(message:String, ...rest):void
    {
      log(LogLevelEnum.FATAL, stringifyArguments(message, rest));
    }


    public function info(message:String, ...rest):void
    {
      log(LogLevelEnum.INFO, stringifyArguments(message, rest));
    }


    public function warn(message:String, ...rest):void
    {
      log(LogLevelEnum.WARN, stringifyArguments(message, rest));
    }


    private function stringifyArguments(message:String, args:Array):String
    {
      args.forEach(function (e:*, i:int, a:Array):void
      {
        message += ' ' + String(e);
      });
      return message;
    }
  }
}
