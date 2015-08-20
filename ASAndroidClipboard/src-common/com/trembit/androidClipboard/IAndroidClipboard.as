/**
 * Created with IntelliJ IDEA.
 * User: Andrey Assaul
 * Date: 14.08.2015
 * Time: 17:06
 */
package com.trembit.androidClipboard {

	import flash.events.IEventDispatcher;

	public interface IAndroidClipboard extends IEventDispatcher {
		function dispose():void;
		function putToClipboard(value:String):void;
	}
}
