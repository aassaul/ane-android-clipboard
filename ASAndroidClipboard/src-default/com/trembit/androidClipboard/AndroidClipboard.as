/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:06
 */
package com.trembit.androidClipboard {

	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.events.EventDispatcher;

	public class AndroidClipboard extends EventDispatcher implements IAndroidClipboard{
		public function dispose():void {}

		public function putToClipboard(value:String):void {
			Clipboard.generalClipboard.clear();
			Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, value);
		}
	}
}
