package it.quidcom.behavior
{
    import flash.display.*;
    import flash.events.MouseEvent;
    
    import it.quidcom.menu.AbstractMenu;
    
    /** 
	* The SelectedBehavior class, manage the last clicked item vista status. 
	*  
	* @author Antonio Stilo
	*/
	public class SelectedBehavior extends AbstractBehavior
	{
		private var defaultValues:Object = {};

		public function SelectedBehavior(_properties:Object=null)
		{
			super();
		}
	override public function set target(_menu:AbstractMenu):void {
            _menu.addEventListener(MouseEvent.CLICK,clickHandler);
        }
	private function clickHandler(evt:MouseEvent):void{
		
		var	scope:Sprite =  Sprite(evt.target.parent.parent);
		var i:int = 0;
		for(i = scope.numChildren-1; i>-1;i--){
			var tmp:AbstractMenu = AbstractMenu(scope.getChildAt(i));
			tmp.selected = false;
		}
			
		if(scope.parent is AbstractMenu){
			for(i = scope.parent.numChildren-1; i>-1;i--)
				AbstractMenu(scope.parent.getChildAt(i)).selected = false;
		}
		if(scope.parent.parent is AbstractMenu){
			for(i = scope.parent.parent.numChildren-1; i>-1;i--)
				AbstractMenu(scope.parent.parent.getChildAt(i)).selected = false;
		}
		
			
		AbstractMenu(evt.target.parent).selected = true;
		
	}
	
	}
}