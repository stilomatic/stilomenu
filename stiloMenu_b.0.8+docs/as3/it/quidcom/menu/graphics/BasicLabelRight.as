package it.quidcom.menu.graphics
{
	
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import it.quidcom.gui.DynamicTextField;
	
	public class BasicLabelRight extends BasicLabel {
		
		public function BasicLabelRight (labelText:String,stile:Object){
			super(labelText,stile);
			}
			
		override protected function init(labelText:String,stile:Object):void{
			 
			myOwnStyle = stile;
			field = DynamicTextField.createTextField(labelText,{autoSize:"right",embedFonts:true,height:20,type:TextFieldType.DYNAMIC});
			field.defaultTextFormat = DynamicTextField.getTextFormat(myOwnStyle);
			field.setTextFormat(DynamicTextField.getTextFormat(myOwnStyle));
			field.mouseEnabled = false;
			addChild(field);
			field.x = -field.width;
		
		}
			
		override public function set label (labeltext:String):void{
			field.text = labeltext;
			field.x = -field.width;
			}

		public function get dimension():uint{
			return field.textWidth;
		}		
	}
}