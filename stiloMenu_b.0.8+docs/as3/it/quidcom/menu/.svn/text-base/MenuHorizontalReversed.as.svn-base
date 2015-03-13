package it.quidcom.menu
{
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.*;
	import it.quidcom.styles.*;
	import it.quidcom.menu.graphics.*;
	
	
	/**
 	* The MenuHorizontalReversed class, is the reversed placement class for MenuHorizontal.
 	* 
 	* @author		Antonio Stilo - stilomatic
 	* @version		1.0
 	* @date 		12.09.2009
 	*
 	*/
	public class MenuHorizontalReversed extends AbstractMenu
	{
		private var type:String=MenuType.HORIZONTAL;
		
		public function MenuHorizontalReversed()
		{
			super();
		}
		
		override public  function addItem(item:AbstractMenu):void {
			
			if (numChildren > 0) {
				item.x = super.getChildAt(numChildren - 1).x - super.getChildAt(numChildren - 1).width - space;
				item.y = 0;
			} else {
				item.x = 0;
				item.y = 0;
			}
			super.addChild(item);
		}
	}
}
