package it.quidcom.menu{

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	import it.quidcom.menu.*;
	import it.quidcom.styles.*;
	import it.quidcom.behavior.*;
	
	import it.quidcom.menu.graphics.*;

	public class ItemReversed extends AbstractMenu {

		private var background:BasicButton;

		public function ItemReversed() {
			super();
			
			this.addEventListener(MouseEvent.ROLL_OVER,overHandler);
			this.addEventListener(MouseEvent.ROLL_OUT,outHandler);
		}
		override public function init(data:XMLNode,stylesBuilder:StyleBuilder,behaviorsBuilder:BehaviorBuilder):void {
			list = data.attributes;
			var styleFlags:Array = data.attributes.styles.split(",");
			setBehaviors(behaviorsBuilder);
			var currentStile:Object = Object(stylesBuilder.getStyle(styleFlags[0]).getStyle());
			field = new BasicLabelRight (list.label,currentStile);
			
			background = new BasicButton(Object(stylesBuilder.getStyle(styleFlags[1]).getStyle()),{width:field.width+2,height:field.height});
			addChild(background);
			addChild(field);
			
			background.x = -field.width;
		}
		
		override public function set label(value:String):void{
                BasicLabelRight(field).label = value;
				background.x = -field.width;
				background.width = field.width;
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
		override public function deactivate():void{
			
		}
		
		override public function activate():void{
		
		}
	}
}