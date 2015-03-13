package it.quidcom.menu
{
	import flash.xml.XMLNode;
	import flash.display.*;
	
	import it.quidcom.behavior.*;
	import it.quidcom.menu.graphics.*;
	import it.quidcom.styles.*;

	public class CardItem extends AbstractMenu
	{
		private var w:int=100;
		private var h:int=100;
		private var background:Sprite;
		
		public function CardItem()
		{
			super();
		}
		override public function init(data:XMLNode,stylesBuilder:StyleBuilder,behaviorsBuilder:BehaviorBuilder):void {
            
            list = data.attributes;
            if(list.width != null) w = list.width;
            if(list.height != null) w = list.height;
            
            var styleFlags:Array = data.attributes.styles.split(",");
            if (list.behaviors!=null || list.behaviors=="") {
				var behaviorFlag:String = list.behaviors;
				var currentBehavior:AbstractBehavior = behaviorsBuilder.getBehavior(behaviorFlag);
				currentBehavior.target = this;
			}
            var currentStile:Object = Object(stylesBuilder.getStyle(styleFlags[0]).getStyle());
            field = new BasicLabel (list.label,currentStile);
            field.x = 5; field.y = 10;
            background = new RoundedButton(Object(stylesBuilder.getStyle(styleFlags[1]).getStyle()),{width:w,height:h});
            addChild(background);
            addChild(field);
        }	
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
		override public function deactivate():void{
			
		}
		
		override public function activate():void{
		
		}
	}
}