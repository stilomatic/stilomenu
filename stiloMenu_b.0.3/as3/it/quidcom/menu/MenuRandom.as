package it.quidcom.menu
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class MenuRandom extends AbstractMenu
	{
		private var swfStage:Stage;
        private var type:String = MenuType.RANDOM;
        
		public function MenuRandom()
		{
			super();
			swfStage = stage;
		}
	    override public  function addItem(item:AbstractMenu):void {
            item.x = (Math.random()*14)*50;
            item.y = (Math.random()*10)*50;
            item.rotation = (Math.random()*36)*10;
            super.addChild(item);
        }
	}
}