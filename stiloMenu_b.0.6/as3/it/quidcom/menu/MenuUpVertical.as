package it.quidcom.menu
{
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.BehaviorBuilder;
	import it.quidcom.styles.StyleBuilder;
    
	public class MenuUpVertical extends AbstractMenu
	{
        private var type:String = MenuType.UPVERTICAL;
        
		public function MenuUpVertical() 
		{
			super();
		}

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