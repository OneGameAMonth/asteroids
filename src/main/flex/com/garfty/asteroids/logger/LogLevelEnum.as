/**
 * Created with IntelliJ IDEA.
 * User: Ken
 * Date: 31/10/2012
 * Time: 22:25
 * To change this template use File | Settings | File Templates.
 */
package com.garfty.asteroids.logger
{

	import flash.utils.describeType;

	public class LogLevelEnum
	{
		public static const DEBUG:LogLevelEnum = new LogLevelEnum(0, 0x000000);
		public static const INFO:LogLevelEnum = new LogLevelEnum(1, 0x00CCFF);
		public static const WARN:LogLevelEnum = new LogLevelEnum(2, 0xFFCC00);
		public static const ERROR:LogLevelEnum = new LogLevelEnum(3, 0xFF0000);
		public static const FATAL:LogLevelEnum = new LogLevelEnum(4, 0xFF0000);

		private var _color:uint;


		private var _ordinal:int;


		private var _name:String;

		{
			InitEnumConstants(LogLevelEnum);
		}

		public function LogLevelEnum(ordinal:int, color:uint)
		{
			_ordinal = ordinal;
			_color = color;
		}


		public static function InitEnumConstants(inType:*):void
		{
			var type:XML = describeType(inType);
			for each (var constant:XML in type.constant)
				inType[constant.@name].name = constant.@name;
		}


		public function toString():String
		{
			return "Ordinal: " + ordinal + " Color: " + _color;
		}


		public function get color():uint
		{
			return _color;
		}


		public function get ordinal():int
		{
			return _ordinal;
		}


		public function get name():String
		{
			return _name;
		}


		public function set name(value:String):void
		{
			_name = value;
		}
	}
}
