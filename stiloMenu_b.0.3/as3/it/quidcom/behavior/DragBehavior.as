package it.quidcom.behavior
{
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import it.quidcom.menu.AbstractMenu;
	   
	public class DragBehavior extends AbstractBehavior
	{
		private const defaultValues:Object = {x:0,y:0,width:1440,height:1024};
		public var rect:Rectangle;
		
		public function DragBehavior(_properties:Object=null)
		{
		    super();
            if (_properties != null) {
                values =_properties;
            } else {
                values =defaultValues;
            }
            rect = new Rectangle();
            rect.top = values.y;
            rect.bottom = values.height;
            rect.left = values.x;
            rect.right = values.width;

		}
		override public function set target(_menu:AbstractMenu):void {      
            _menu.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
            _menu.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
        }
        public function mouseDownHandler(evt:MouseEvent):void{
        	    trace("Super_mouseDownHandler");
                evt.target.parent.startDrag (false,rect);
                evt.target.addEventListener(MouseEvent.MOUSE_MOVE,refresh);
        }
        public function mouseUpHandler(evt:MouseEvent):void{
        	    trace("Super_mouseUpHandler");
                evt.target.parent.stopDrag ();
                evt.target.removeEventListener(MouseEvent.MOUSE_MOVE,refresh);
        }
        public function refresh(evt:MouseEvent):void {
            evt.updateAfterEvent();
        }
	}
}