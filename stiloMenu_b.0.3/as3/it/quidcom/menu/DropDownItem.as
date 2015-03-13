package it.quidcom.menu
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.*;
	import it.quidcom.menu.graphics.*;
	import it.quidcom.styles.*;

	public class DropDownItem extends AbstractMenu
	{
		public var background:BasicButton;
		public var open:Boolean = false;
		
		public function DropDownItem()
		{
		    super();
            this.addEventListener(Event.ADDED_TO_STAGE,events);
		}
		
		override public function init(data:XMLNode,stile:StyleBuilder,behavior:BehaviorBuilder):void {
            list = data.attributes;
            var styleFlags:Array = data.attributes.styles.split(",");
            if (data.attributes.behavior != null || data.attributes.behavior == "") {
                var behaviorFlag:String = data.attributes.behavior;
                var currentBehavior:AbstractBehavior = behavior.getBehavior(behaviorFlag);
                currentBehavior.target = this;
            }
            var currentStile :Object = Object(stile.getStyle(styleFlags[0]).getStyle());
            field = new BasicLabel (list.label,currentStile);
            background = new BasicButton(Object(stile.getStyle(styleFlags[1]).getStyle()),{width:field.width,height:field.height});
            addChild(background);
            addChild(field);

        }
        private function events (evt:Event):void{
            
           this.addEventListener(MouseEvent.ROLL_OVER,overHandler);
           this.addEventListener(MouseEvent.ROLL_OUT,outHandler);
           this.addEventListener(MouseEvent.CLICK,openHandler);
        
        }
        
        public function set label(value:String):void{
        	   var str:String;
        	    if(value.length > 28){
                var index:int = value.indexOf(" ",10);
                str = value.substr(0,index)+"\n"+value.substr(index+1,value.length);
            }else{
                 str = value;
            }     
                field.label = str;
        } 
        
        public function get label():String{
                return field.label;
        } 
        
        override public function get selected():Boolean {
            return selection;
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
        public function overHandler(evt:MouseEvent=null):void {
            if (!selection) {
            	field.selected = true;
                background.selected=true;
            }
        }
        public function outHandler(evt:MouseEvent=null):void {
            if (!selection) {
            	field.selected = false;
                background.selected=false;
            }
        }
        public function openHandler(evt:MouseEvent=null):void {
        	if(!open){
        		DropDownMenu(this.parent).buildMenu();
        		open = true;
        	}else	
        		DropDownMenu(this.parent).unBuildMenu();	
        }	
	}
}