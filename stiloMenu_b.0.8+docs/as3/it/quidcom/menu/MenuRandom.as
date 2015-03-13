package it.quidcom.menu
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	/** 
	* The MenuRandom class, build a random position for each menu items 
	* 
	* @author Antonio Stilo
	*/
	public class MenuRandom extends AbstractMenu
	{
		private var swfStage:Stage;
        private var type:String = MenuType.RANDOM;
        
		public function MenuRandom()
		{
			super();
			swfStage = stage;
		}
		
		/** 
		* populate the menu with a new item:<code>AbstractMenu</code> and place the item by params. 
		* This method is called by the <code>MenuBuilder</code>. 
		* 
		* @param item <code>AbstractMenu</code> the item to populate the menu.
		* @return void 
		*/
	    override public  function addItem(item:AbstractMenu):void {
            item.x = (Math.random()*14)*50;
            item.y = (Math.random()*10)*50;
            item.rotation = (Math.random()*36)*10;
            super.addChild(item);
        }
	}
}