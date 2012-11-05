/**
 * http://opensource.adobe.com/svn/opensource/flex/sdk/trunk/frameworks/projects/framework/src/mx/logging/ILogger.as
 *
 *  //  ADOBE SYSTEMS INCORPORATED
 *  //  Copyright 2005-2007 Adobe Systems Incorporated
 *  //  All Rights Reserved.
 *  //
 *  //  NOTICE: Adobe permits you to use, modify, and distribute this file
 *  //  in accordance with the terms of the license agreement accompanying it.
 */
package com.garfty.asteroids.logger
{

	import flash.events.IEventDispatcher;

	public interface ILogger extends IEventDispatcher
	{
		/**
		 *  Designates informational level
		 *  messages that are fine grained and most helpful when debugging an
		 *  application.
		 */
		function debug(message:String, ...rest):void;


		/**
		 *  Designates error events that might
		 *  still allow the application to continue running.
		 */
		function error(message:String, ...rest):void;


		/**
		 *  Designates events that are very
		 *  harmful and will eventually lead to application failure.
		 */
		function fatal(message:String, ...rest):void;


		/**
		 *  Designates informational messages that
		 *  highlight the progress of the application at coarse-grained level.
		 */
		function info(message:String, ...rest):void;


		/**
		 *  Designates events that could be
		 *  harmful to the application operation.
		 */
		function warn(message:String, ...rest):void
	}
}
