package
{
	import flash.display.MovieClip;
	import flash.xml.XMLDocument;
	
	import it.quidcom.xml.LoaderXml;
	import it.quidcom.menu.*;

	public class Index extends MovieClip
	{
		private var menu:AbstractMenu;
				
		public function Index()
		{
			super();
			//var loader:LoaderXml = new LoaderXml("./xml/horizontalMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/horizontalReversedMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/verticalMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/verticalMenuReversed.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/randomMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/mixedMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/dropDownMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/dropMenuReversed.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/gridMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/gridCardMenu.xml",parseMenu);
			//var loader:LoaderXml = new LoaderXml("./xml/cardAssetGridMenu.xml",parseMenu);
			var loader:LoaderXml = new LoaderXml("./xml/randomCardMenu.xml",parseMenu);
			
			
		}
		
		public function parseMenu(xml:XMLDocument):void{
        	
            var menuFactory:MenuBuilder = new MenuBuilder(xml.firstChild);
            menu = menuFactory.menu;
            menu.buttonMode = true;
            addChild(menu);
            
   		}
		
	}
}