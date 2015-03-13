package it.quidcom.menu
{
    import flash.events.MouseEvent;
    import flash.xml.XMLNode;
    
	import it.quidcom.behavior.*;
	import it.quidcom.menu.graphics.*;
	import it.quidcom.styles.*;
    
	/**
 	* The MenuGrid class is a grid item placing menu.
 	* 
 	* @author		Antonio Stilo - stilomatic
 	* @version		1.0
 	* @date 		03.09.2009
 	*
 	* @example To create a menu with <code>MenuGrid</code> as menu write in the xml file after the <styles> and <behaviors> nodes the following xml:
 	
	 <item classType="it.quidcom.menu.MenuGrid" x="20" y="30" space="4" module="3" behaviors="selected" >
     <kids>
       	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="0" uid="model" label="MODELLO 01" />
	   	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="1" uid="model" label="MODELLO 02" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="2" uid="model" label="MODELLO 03" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="3" uid="model" label="MODELLO 04" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="4" uid="model" label="MODELLO 05" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="5" uid="model" label="MODELLO 05" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="6" uid="model" label="MODELLO 01" />
	 	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="7" uid="model" label="MODELLO 02" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="8" uid="model" label="MODELLO 03" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="9" uid="model" label="MODELLO 04" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="10" uid="model" label="MODELLO 05" />
      	<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="11" uid="model" label="MODELLO 05" />
     </kids>
	 </item>
 	*/
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
		
		/** 
		* Is a generic constructor for all the classes that extends the <code>AbstractMenu</code>. 
		* This method is called by the <code>MenuBuilder</code>.. 
		* 
		* @param data <code>XMLNode</code> the Xml node to pass data to the object.
		* @param stylesBuilder <code>StyleBuilder</code> manage the styles.
		* @param behaviorsBuilder <code>BehaviorBuilder</code> manage the behaviors.
		* @return void 
		*/  
		 override public function init(data:XMLNode,stylesBuilder:StyleBuilder,behaviorsBuilder:BehaviorBuilder):void{
		 	
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
          
          setBehaviors(behaviorsBuilder);
          
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
