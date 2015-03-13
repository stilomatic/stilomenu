package it.quidcom.menu
{
    import flash.events.MouseEvent;

	public class DropDownMenu extends AbstractMenu
	{
		public var menuSelector:AbstractMenu;
		public var button:AbstractMenu;
        private var type:String = MenuType.DROP_DOWN;
        
		public function DropDownMenu()
		{
			super();
		}

      
    override public  function addItem(item:AbstractMenu):void {	
            if(item is DropDownItem){
                super.addChild(item);
                button = item;
            }else{
                menuSelector = item;
                menuSelector.addEventListener(MouseEvent.CLICK,setLabelHandler);
            }
    }
    
    public function unBuildMenu(evt:MouseEvent=null):void{
    	
           if(this.contains(menuSelector)){
             removeChild(menuSelector);
             menuSelector.removeEventListener(MouseEvent.CLICK,unBuildMenu);
             DropDownItem(this.button).open = false;
           }
                   
    }
    
    public function buildMenu():void{
    	
    	if(menuSelector is MenuVertical) 
    	   menuSelector.y = button.height+space;
    	else 
    		menuSelector.y = 0;
    	   
        addChild(menuSelector);
        menuSelector.addEventListener(MouseEvent.CLICK,unBuildMenu);   
    
	}
	
	private function setLabelHandler(evt:MouseEvent){
	
		button.field.label = evt.target.parent.data.label;
	
	}
	
}
}