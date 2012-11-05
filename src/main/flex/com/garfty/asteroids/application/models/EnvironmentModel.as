/**
 * User: Sagat
 * Date: 01/11/2012
 */
package com.garfty.asteroids.application.models
{

	import org.robotlegs.mvcs.Actor;

	public class EnvironmentModel extends Actor implements IEnvironmentModel
	{
		private var _flashVars:Object;

		private var _assetPath:String;
		private var _servicePath:String;
		private var _swfPath:String;


		public function EnvironmentModel()
		{
			super();
		}


		/**
		 * @inheritDoc
		 */
		public function get flashVars():Object
		{
			return _flashVars;
		}


		/**
		 * @inheritDoc
		 */
		public function set flashVars(value:Object):void
		{
			_flashVars = value;
		}


		/**
		 * @inheritDoc
		 */
		public function get assetPath():String
		{
			return _assetPath;
		}


		/**
		 * @inheritDoc
		 */
		public function set assetPath(value:String):void
		{
			_assetPath = value;
		}


		/**
		 * @inheritDoc
		 */
		public function get servicePath():String
		{
			return _servicePath;
		}


		/**
		 * @inheritDoc
		 */
		public function set servicePath(value:String):void
		{
			_servicePath = value;
		}


		/**
		 * @inheritDoc
		 */
		public function get swfPath():String
		{
			return _swfPath;
		}


		/**
		 * @inheritDoc
		 */
		public function set swfPath(value:String):void
		{
			_swfPath = value;
		}


		/**
		 * @inheritDoc
		 */
		public function getFlashVar(variableName:String, errorIfUndefined:Boolean = true):String
		{
			var value:String = flashVars[variableName];
			if (!value && errorIfUndefined) {
				throw new Error("FlashVar with name : '" + variableName + "' is undefined.");
			}
			return value;
		}
	}
}
