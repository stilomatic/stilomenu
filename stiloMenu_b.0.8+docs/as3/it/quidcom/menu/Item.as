package it.quidcom.menu{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	import it.quidcom.menu.*;
	import it.quidcom.styles.*;
	import it.quidcom.behavior.*;
	
	import it.quidcom.menu.graphics.*;

	/** 
	* The Item class, is a basic item. 
	* Consist of a label a button and mouseOver mouseOut events.
	* 
	* @author Antonio Stilo
	*/
	public class Item extends AbstractMenu {

		private var background:BasicButton;

		public function Item() {
			
			super();

			this.addEventListener(MouseEvent.ROLL_OVER,overHandler);
			this.addEventListener(MouseEvent.ROLL_OUT,outHandler);
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
			var styleFlags:Array = data.attributes.styles.split(",");
			setBehaviors(behaviorsBuilder);
			var currentStile:Object = Object(stylesBuilder.getStyle(styleFlags[0]).getStyle());
			field = new BasicLabel (list.label,currentStile);
			background = new BasicButton(Object(stylesBuilder.getStyle(styleFlags[1]).getStyle()),{width:field.width+2,height:field.height});
			addChild(background);
			addChild(field);
		}
		
		
		private function overHandler(evt:MouseEvent):void {
			if (!selection) {
				field.selected = true;
				background.selected = true;
			}
		}
		private function outHandler(evt:MouseEvent):void {
			if (!selection) {
				field.selected = false;
				background.selected = false;
			}
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