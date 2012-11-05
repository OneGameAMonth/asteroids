/**
 * User: Sagat
 * Date: 05/11/2012
 */
package com.garfty.asteroids.game.utils
{
	import flash.text.Font;

	public class EditUndoFont
	{
		[Embed(source="/../resources/fonts/edunline.ttf", fontName="Edit Undo Line", fontStyle="normal", fontWeight="normal", embedAsCFF="false")]
		private static var FontClass:Class;

		private var _instance:Font;


		public function EditUndoFont()
		{
			super();

			Font.registerFont(FontClass);
			_instance = new FontClass();
		}
	}
}
