package it.quidcom.behavior
{
    import flash.events.MouseEvent;
    import flash.display.Sprite;
    import it.quidcom.menu.AbstractMenu;
    
    /** 
	* The ZSortBehavior class, manage the z-sort for the items list of the menu. 
	*  
	* @author Antonio Stilo
	*/
	public class ZSortBehavior extends AbstractBehavior
	{
		private var defaultValues:Object = {unSortTo:0};

		public function ZSortBehavior(_properties:Object=null)
		{
			super();
			if (_properties != null) {
                values =_properties;
            } else {
                values =defaultValues;
            }
			
		}
	override public function set target(_menu:AbstractMenu):void {
            _menu.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
            _menu.addEventListener(MouseEvent.ROLL_OUT,rollOutHandler);
        }
	private function rollOverHandler(evt:MouseEvent):void{
	   evt.target.parent.setChildIndex(evt.target,evt.target.parent.numChildren-1);
	}
	private function rollOutHandler(evt:MouseEvent):void{
         evt.target.parent.setChildIndex(evt.target,values.unSortTo);
    }
	}
}