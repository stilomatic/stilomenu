package it.quidcom.menu
{

	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.*;
	import it.quidcom.styles.*;
	import it.quidcom.menu.graphics.*;
    
	/** 
	* The MenuHorizontal class, build an horizontal menu 
	* 
	* @author Antonio Stilo
	*/   
	public class MenuHorizontal extends AbstractMenu {

		private var type:String=MenuType.HORIZONTAL;


		public function MenuHorizontal() {
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
			
			if(item.x == 0){
			if (numChildren > 0) {
				item.x=super.getChildAt(numChildren - 1).x + super.getChildAt(numChildren - 1).width + space;
				item.y=0;
			} else {
				item.x = 0;
				item.y = 0;
			}
			}
			super.addChild(item);
		}
	}
}