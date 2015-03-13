package it.quidcom.menu
{
	import flash.xml.XMLNode;
	import flash.display.*;
	
	import it.quidcom.behavior.*;
	import it.quidcom.menu.graphics.*;
	import it.quidcom.styles.*;

	/** 
	* The ItemCard class, is an item. 
	* Consist of a label a squared and rounded button and have implemented the mouseOver mouseOut events.
	* 
	* @author Antonio Stilo
	*/
	public class ItemCard extends AbstractMenu
	{
		private var w:int=100;
		private var h:int=100;
		private var background:Sprite;
		
		public function ItemCard()
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
		override public function init(data:XMLNode,stylesBuilder:StyleBuilder,behaviorsBuilder:BehaviorBuilder):void {
            
            list = data.attributes;
            if(list.width != null) w = list.width;
            if(list.height != null) w = list.height;
            
            var styleFlags:Array = data.attributes.styles.split(",");
            setBehaviors(behaviorsBuilder);
            var currentStile:Object = Object(stylesBuilder.getStyle(styleFlags[0]).getStyle());
            field = new BasicLabel (list.label,currentStile);
            field.x = 5; field.y = 10;
            background = new RoundedButton(Object(stylesBuilder.getStyle(styleFlags[1]).getStyle()),{width:w,height:h});
            addChild(background);
            addChild(field);
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
				RoundedButton(background).selected = true;
			} else {
				field.selected = false;
				RoundedButton(background).selected = false;
			}

		}
		
		/** 
		* Set the item unclickable.
		* 
		* @return void 
		*/  
		override public function deactivate():void{
			
		}
		
		/** 
		* Set the item clickable.
		* 
		* @return void 
		*/
		override public function activate():void{
		
		}
	}
}