package it.quidcom.menu.graphics
{
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import it.quidcom.gui.DynamicTextField;
	
	public class BasicLabel extends AbstractGraphic implements iGraphic{
		
		public var field:TextField;
		public var myOwnStyle:Object;
		
		public function BasicLabel (labelText:String,stile:Object){
			super();
			init(labelText,stile);
			}
			
		protected function init(labelText:String,stile:Object):void{
			     
			myOwnStyle = stile;
			field = DynamicTextField.createTextField(labelText,{autoSize:"left",embedFonts:true,width:150,height:20,type:TextFieldType.DYNAMIC});
			field.defaultTextFormat = DynamicTextField.getTextFormat(myOwnStyle);
			field.setTextFormat(DynamicTextField.getTextFormat(myOwnStyle));
			field.mouseEnabled = false;
			addChild(field);
			
		}
		
		override public function set label (labeltext:String):void{
			field.text = labeltext;
			}
		public function get label ():String{
            return field.text;
            }
		public function textColor(color:uint):void{
		  field.textColor = color;
		}
		override public function set selected (value:Boolean):void{
			selection = value;
			if(selection){
				textColor(myOwnStyle.over);
			}else{
				textColor(myOwnStyle.color);
			}
		}		
	}
}