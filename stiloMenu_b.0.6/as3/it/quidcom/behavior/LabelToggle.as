package it.quidcom.behavior
{
	import flash.events.MouseEvent;
	
	import it.quidcom.menu.AbstractMenu;
    import it.quidcom.menu.graphics.BasicLabel;

	public class LabelToggle extends AbstractBehavior
	{
		private const defaultValues:Object = {type:"CLICK"};
            
        public function LabelToggle(_properties:Object=null)
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
            menu.addEventListener(MouseEvent.CLICK,switchLabelAndValues);
        }
        private function switchLabelAndValues(evt:MouseEvent):void{
        	
            var target:AbstractMenu = AbstractMenu(evt.currentTarget);

            if(!target.selected){
            	trace("TOGGLE CLICK APRO");
                target.extra.currentValue = target.data.idOn;
                BasicLabel(target.field).label = target.data.labelOn;
                target.selected = true;
            }else{
            	trace("TOGGLE CLICK CHIUDO");
                target.extra.currentValue = target.data.idOff;
                BasicLabel(target.field).label = target.data.label;
                target.selected = false;
            }
               
        }
	}
}
