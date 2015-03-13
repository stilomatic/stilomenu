package it.quidcom.menu
{
    import flash.events.MouseEvent;

	/**
 	* The MenuDropDown class is a drop down menu.
 	* 
 	* @author		Antonio Stilo - stilomatic
 	* @version		1.0
 	* @date 		03.09.2009
 	*
 	* @example To create a menu with <code>MenuDropDown</code> as menu write in the xml file after the <styles> and <behaviors> nodes the following xml:
 	
	 <item classType="it.quidcom.menu.MenuDropDown" x="20" y="30" space="4">
     <kids>
     	<item classType="it.quidcom.menu.ItemDropDown" styles="textStyle,background" behaviors="alphaAnim" label="Drop Down Selected value" />
   		<item classType="it.quidcom.menu.MenuVertical" behaviors="selected" space="2">
    	<kids>
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="0" uid="model" label="MODELLO 01" />
			<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="1" uid="model" label="MODELLO 02" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="2" uid="model" label="MODELLO 03" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="3" uid="model" label="MODELLO 04" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="4" uid="model" label="MODELLO 05" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="4" uid="model" label="MODELLO 05" />
    	</kids>
		</item>
	 </kids>
	 </item>
 	*/
	public class MenuDropDown extends AbstractMenu
	{
		public var menuSelector:AbstractMenu;
		public var button:AbstractMenu;
        private var type:String = MenuType.DROP_DOWN;
        
		public function MenuDropDown()
		{
			super();
		}

    /** 
	* populate the menu with a new item:<code>AbstractMenu</code> and place the item by params. 
	* This method is called by the <code>MenuBuilder</code>. 
	* 
	* @param item <code>AbstractMenu</code> the item to populate the menu.
	* @return void 
	*/  
    override public  function addItem(item:AbstractMenu):void {	
            if(item is ItemDropDown){
                super.addChild(item);
                button = item;
            }else{
                menuSelector = item;
                menuSelector.addEventListener(MouseEvent.CLICK,clickHandler);
            }
    }
    
    /** 
	* close the drop down menu. 
	* This method is called by the <code>DropDownItem</code>. 
	* 
	* @param evt <code>MouseEvent</code>.
	* @return void 
	*/ 
    public function unBuildMenu(evt:MouseEvent=null):void{
    	
           if(this.contains(menuSelector)){
             removeChild(menuSelector);
             menuSelector.removeEventListener(MouseEvent.CLICK,unBuildMenu);
             ItemDropDown(this.button).open = false;
           }
                   
    }
    
    /** 
	* open the drop down menu. 
	* This method is called by the <code>DropDownItem</code>. 
	* 
	* @return void 
	*/
    public function buildMenu():void{
    	
    	if(menuSelector is MenuVertical) 
    	   menuSelector.y = button.height+space;
    	else 
    		menuSelector.y = 0;
    	   
        addChild(menuSelector);
        menuSelector.addEventListener(MouseEvent.CLICK,unBuildMenu);   
    
	}
	
	private function clickHandler(evt:MouseEvent):void{
	
		button.field.label = evt.target.parent.data.label;
	
	}
	
}
}