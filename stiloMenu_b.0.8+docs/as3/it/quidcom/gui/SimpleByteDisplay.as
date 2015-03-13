package it.quidcom.gui{
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class SimpleByteDisplay extends Sprite{
		
		private var textObj:TextField;
		private var count:Number = 0;
		private var style:TextFormat;
		private var str:String ="Loading: ";
		
		public function SimpleByteDisplay(_o:Object=null,_s:Object=null){
			super();
			if (_o==null)_o = {html:false,x:0,y:0,width:100,height:18};
			_o.html = false;
			_o.selectable = false;
			this.textObj = DynamicTextField.createTextField(str,_o);
			addChild (this.textObj);
			changeFormat(_s);
			}
		public function set label(_s:String):void{
				str = _s;
			}
		public function get label():String{
				return str;
			}
		public function get value ():Number{
				return count;
			}
		public function set value (n:Number):void{
				count = n;
				this.textObj.text = str+count+" %";
				
			}
		public function changeFormat(_s:Object=null):void {
			if (_s==null) {
				style = DynamicTextField.getTextFormat({font:"Verdana",size:11,color:0x000000});
			} else {
				style =  DynamicTextField.getTextFormat(_s);
			}
			this.textObj.defaultTextFormat = style;
			this.textObj.setTextFormat(style);
		}
		
		
		}
	}
