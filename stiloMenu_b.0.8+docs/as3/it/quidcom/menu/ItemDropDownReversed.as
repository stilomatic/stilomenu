package it.quidcom.menu
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.*;
	import it.quidcom.menu.graphics.*;
	import it.quidcom.styles.*;
	
	/**
 	* The ItemDropDownReversed class, is the reversed placement class for ItemDropDown.
 	* 
 	* @author		Antonio Stilo - stilomatic
 	* @version		1.0
 	* @date 		12.09.2009
 	*
 	*/
	public class ItemDropDownReversed extends ItemDropDown
	{	
		public function ItemDropDownReversed()
		{
		    super();
		}
		
		override public function init(data:XMLNode,stylesBuilder:StyleBuilder,behaviorsBuilder:BehaviorBuilder):void {
            list = data.attributes;
            var styleFlags:Array = data.attributes.styles.split(",");
            setBehaviors(behaviorsBuilder);
            var currentStile :Object = Object(stylesBuilder.getStyle(styleFlags[0]).getStyle());
            field = new BasicLabelRight (list.label,currentStile);
            background = new BasicButton(Object(stylesBuilder.getStyle(styleFlags[1]).getStyle()),{width:field.width+2,height:field.height});
            addChild(background);
            addChild(field);
			background.x = -field.width;
        }

        override public function set label(value:String):void{
        		     
                BasicLabelRight(field).label = value;
                background.resize(BasicLabelRight(field).width+2);
                background.x = -field.width;
        } 
	}
}