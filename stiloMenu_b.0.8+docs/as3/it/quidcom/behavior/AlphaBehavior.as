﻿package it.quidcom.behavior{

    import it.quidcom.menu.*;
	import flash.events.*;
	import caurina.transitions.Tweener;
	import flash.display.Sprite;

	public class AlphaBehavior extends AbstractBehavior {
		
		private const defaultValues:Object = {out:0.8,over:0.3,time:0.5};
		
		public function AlphaBehavior(_properties:Object=null) {
			super();
			if (_properties != null) {
				values =_properties;
			} else {
				values =defaultValues;
			}
		}
		override public function set target(_menu:AbstractMenu):void {
			_menu.alpha = values.out;
			_menu.addEventListener(MouseEvent.ROLL_OVER,overHandler);
			_menu.addEventListener(MouseEvent.ROLL_OUT,outHandler);
			//_menu.addEventListener(MouseEvent.CLICK,clickHandler);
		}
		private function overHandler(evt:MouseEvent):void {
			Tweener.addTween(evt.target, {alpha:values.over, time:values.time, transition:"linear"});
		}
		private function outHandler(evt:MouseEvent):void {
			Tweener.addTween(evt.target, {alpha:values.out, time:values.time, transition:"linear"});
		}
		/*private function clickHandler(evt:MouseEvent):void {
			Tweener.addTween(evt.target, {alpha:values.out, time:values.time, transition:"linear"});
		}*/
	}
}