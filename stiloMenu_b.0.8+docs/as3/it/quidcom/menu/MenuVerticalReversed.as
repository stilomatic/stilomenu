package it.quidcom.menu
{
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.BehaviorBuilder;
	import it.quidcom.styles.StyleBuilder;
    
    /** 
	* The MenuVerticalReversed class, build a vertical menu sorted reversed. 
	* 
	* @author Antonio Stilo
	*/
	public class MenuVerticalReversed extends AbstractMenu
	{
        private var type:String = MenuType.UPVERTICAL;
        
		public function MenuVerticalReversed() 
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
          
           if(item.y == 0){
            if (numChildren > 0) {
                item.x = 0;
                item.y = super.getChildAt(numChildren - 1).y - super.getChildAt(numChildren - 1).height - space;
            } else {
                item.x = 0;
                item.y = -(item.height+space);
            }
           }
            super.addChild(item);
            

        }
	}
}