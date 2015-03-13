package it.quidcom.menu
{
    import flash.events.MouseEvent;
    import flash.xml.XMLNode;
    
    import it.quidcom.behavior.BehaviorBuilder;
    import it.quidcom.styles.StyleBuilder;
    

	public class MenuGrid extends AbstractMenu
	{
		private var spaceH:int = 3;
		private var spaceV:int = 3;
        private var type:String = MenuType.MENU_GRID;
        
        private var cx:int = 0;
        private var cy:int = 0;
        private var module:int;
        
		public function MenuGrid()
		{
			super();
		}
		
		 override public function init(data:XMLNode,stile:StyleBuilder,behavior:BehaviorBuilder):void{
		 	
          list = data.attributes;
          if( list.space != null ){ 
            spaceH = int(list.space);
            spaceV = int(list.space);
          }
          if( list.spaceH !=null ) this.spaceH = Number(list.spaceH);
          if( list.spaceV !=null ) this.spaceV = Number(list.spaceV);
          
          if( list.x!=null ) this.x = Number(list.x);
          if( list.y!=null ) this.y = Number(list.y);         
          this.module = uint(list.module);
          
        }
        override public  function addItem(item:AbstractMenu):void {
          
            if(item.x == 0){   
                item.x = (item.width + spaceH) * cx;
                item.y = (item.height + spaceV) * cy;
            }
            super.addChild(item);
            cx++;

            if ((cx%module) == 0)
            {
            	trace("> "+(cx%module));
                cx=0;
                cy++;
            }
        }
	}
}
