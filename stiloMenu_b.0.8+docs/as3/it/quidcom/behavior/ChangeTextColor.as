package it.quidcom.behavior
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import it.quidcom.menu.AbstractMenu;
    
    /** 
	* The ChangeTextColor class, is the class to have a label color change roll over effect. 
	* This class is deprecated.
	*  
	* @author Antonio Stilo
	*/
	public class ChangeTextColor extends AbstractBehavior
	{
		private const defaultValues:Object = {overColor:0xFFFFFFF,outColor:0x333333};
        
		public function ChangeTextColor(_properties:Object=null)
		{
			super();
            if (_properties != null) {
                values = _properties;
            } else {
                values = defaultValues;
            }
		}
		override public function set target(_menu:AbstractMenu):void {
           _menu.addEventListener(MouseEvent.ROLL_OVER,overHandler);
           _menu.addEventListener(MouseEvent.ROLL_OUT,overHandler);
        }
        private function overHandler(evt:MouseEvent):void {
        	
        	var target:AbstractMenu = AbstractMenu(evt.currentTarget);
        	var textField:TextField = TextField(target.field);
        	var format:TextFormat = textField.getTextFormat();
        	if(evt.type == MouseEvent.ROLL_OVER){
        	   format.color = values.overColor;
        	}else{
        	   format.color = values.outColor;
        	}
        	textField.setTextFormat(format);
        	
        }
	}
}