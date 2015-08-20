/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:06
 */
package com.trembit.androidClipboard {
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;

	public class AndroidClipboard extends EventDispatcher implements IAndroidClipboard{

		private var extContext:ExtensionContext;

		public function AndroidClipboard() {
			extContext = ExtensionContext.createExtensionContext("com.trembit.extension.AndroidClipboard", null);
		}

		public function dispose():void {
			extContext.dispose();
		}

		public function putToClipboard(value:String):void {
			value ||= "";
			var codePoints:Vector.<int> = new Vector.<int>(value.length, true);
			var l:int = value.length;
			for(var i:int = 0; i < l; i++) {
				codePoints[i] = value.charCodeAt(i);
			}
			extContext.call("putToClipboard", codePoints);
		}
	}
}
