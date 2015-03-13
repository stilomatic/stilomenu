package it.quidcom.menu
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.*;
	import it.quidcom.menu.graphics.*;
	import it.quidcom.styles.*;

	/**
 	* The ItemDropDown class is an item to be used with the drop down menu as first item.
 	* 
 	* @author		Antonio Stilo - stilomatic
 	* @version		1.0
 	* @date 		03.09.2009
 	*
 	* @example To use the item object <code>ItemDropDown</code> with the <code>MenuDropDown</code> write in the xml file after the < styles > and < behaviors > nodes the following xml:
 	 <p><item classType="it.quidcom.menu.DropDownMenu" x="20" y="30" space="4">
     <kids>
     	<item classType="it.quidcom.menu.ItemDropDown" styles="textStyle,background" behaviors="alphaAnim" label="Drop Down Selected value" />
   		<item classType="it.quidcom.menu.MenuVertical" behaviors="selected" space="2">
    	<kids>
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="0" uid="model" label="MODELLO 01" />
			<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="1" uid="model" label="MODELLO 02" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="2" uid="model" label="MODELLO 03" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="3" uid="model" label="MODELLO 04" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="4" uid="model" label="MODELLO 05" />
    		<item classType="it.quidcom.menu.BasicItem" styles="textStyle,background" behaviors="alphaAnim" id="4" uid="model" label="MODELLO 06" />
    	</kids>
		</item>
	 </kids>
	 </item></p>
 	*/
	public class ItemDropDown extends AbstractMenu
	{
		public var background:BasicButton;
		public var open:Boolean = false;
		
		public function ItemDropDown()
		{
		    super();
            this.addEventListener(Event.ADDED_TO_STAGE,events);
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
		override public function init(data:XMLNode,stylesBuilder:StyleBuilder,behaviorsBuilder:BehaviorBuilder):void {
			
            list = data.attributes;
            
            setBehaviors(behaviorsBuilder);
            
            var styleFlags:Array = data.attributes.styles.split(",");
            var currentStile :Object = Object(stylesBuilder.getStyle(styleFlags[0]).getStyle());
            
            field = new BasicLabel (list.label,currentStile);
            background = new BasicButton(Object(stylesBuilder.getStyle(styleFlags[1]).getStyle()),{width:field.width,height:field.height});
            addChild(background);
            addChild(field);

        }
        
        private function events (evt:Event):void{
            
           this.addEventListener(MouseEvent.ROLL_OVER,overHandler);
           this.addEventListener(MouseEvent.ROLL_OUT,outHandler);
           this.addEventListener(MouseEvent.CLICK,openHandler);
        
        }
        
        /** 
		* Set the string value of label of the item.
		* 
		* @param value <code>String</code> the string value to be setted.
		* @return void 
		*/
        override public function set label(value:String):void{
        	   var str:String;
        	    if(value.length > 28){
                var index:int = value.indexOf(" ",10);
                str = value.substr(0,index)+"\n"+value.substr(index+1,value.length);
            }else{
                 str = value;
            }     
                field.label = str;
        } 
        
        /** 
		* Get the string value of label of the item.
		* 
		* @return String 
		*/
        public function get label():String{
                return BasicLabel(field).label;
        } 
        
        override public function get selected():Boolean {
            return selection;
        }
        
        /** 
		* Set the selected status of the item.
		* 
		* @param value <code>Boolean</code> if the item is selected or not.
		* @return void 
		*/
        override public function set selected(value:Boolean):void {
            selection = value;
            if (selection) {
                field.selected = true;
                background.selected = true;
            } else {
                field.selected = false;
                background.selected = false;
            }

        }
        
        /** 
		* Mouse Over handler. Set field and background as selected.
		* 
		* @param evt <code>MouseEvent</code>.
		* @return void 
		*/
        public function overHandler(evt:MouseEvent=null):void {
            if (!selection) {
            	field.selected = true;
                background.selected=true;
            }
        }
        
        /** 
		* Mouse Out handler. Set field and background as not selected.
		* 
		* @param evt <code>MouseEvent</code>.
		* @return void 
		*/
        public function outHandler(evt:MouseEvent=null):void {
            if (!selection) {
            	field.selected = false;
                background.selected=false;
            }
        }
        
        /** 
		* Open or close the drop down menu it's invoked by a MouseEvent.CLICK.
		* 
		* @param evt <code>MouseEvent</code>.
		* @return void 
		*/
        public function openHandler(evt:MouseEvent=null):void {
        	if(!open){
        		MenuDropDown(this.parent).buildMenu();
        		open = true;
        	}else	
        		MenuDropDown(this.parent).unBuildMenu();	
        }	
	}
}