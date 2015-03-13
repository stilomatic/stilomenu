package it.quidcom.behavior
{
	import caurina.transitions.Tweener;
	import flash.events.Event;
	import it.quidcom.menu.AbstractMenu;

	public class TendToPoint extends AbstractBehavior
	{
		private const defaultValues:Object = {time:0.5};
	    	
		public function TendToPoint(_properties:Object=null)
		{
			super();
			if (_properties != null) {
                values = _properties;
            } else {
                values = defaultValues;
            }
            
		}
		override public function set target(_menu:AbstractMenu):void {
            menu = _menu;          
            menu.addEventListener(Event.ENTER_FRAME,loop);
        }
        private function loop(evt:Event):void{
            var target:AbstractMenu = AbstractMenu(evt.currentTarget);
            var curTime:Number = Number(values.time)+Number(target.extra.id);
        //    trace("[TendToPoint] loop "+curTime);
            Tweener.addTween(target,{x:target.extra.pointX,y:target.extra.pointY,time:curTime,transition:"easeOutElastic"})
        }
	}
}