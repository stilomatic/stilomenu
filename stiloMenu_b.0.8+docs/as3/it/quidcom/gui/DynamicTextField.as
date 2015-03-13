/* 
DynamicTextField stilo@quidcom.it © 18/03/2008

EXAMPLE
			import it.quidcom.gui.DynamicTextField;
			
			var textField:TextField = DynamicTextField.createTextField(_str,{width:300,height:100,embedFonts:true,border:true});
			textField.defaultTextFormat = DynamicTextField.getTextFormat({font:"Verdana",size:11,color:0x000000});
			textField.setTextFormat(DynamicTextField.getTextFormat({font:"Verdana",size:11,color:0x000000}));

*/
package it.quidcom.gui
{
	import flash.text.*;

	public class DynamicTextField extends TextField
	{
		public static function createTextField(_s:String,_o:Object):TextField{
		
			var tmp:TextField = new TextField();
			/*tmp.x = _o.x; tmp.y = _o.y;
			tmp.width = _o.width; tmp.height = _o.height;
			tmp.wordWrap = _o.wordWrap;
			if(_o.type != null) tmp.type = _o.type;
			if(_o.selectable!=null){tmp.selectable=_o.selectable;}
			if(_o.autoSize!=null)tmp.autoSize = _o.autoSize;
			if(_o.embedFonts!=null)tmp.embedFonts =_o.embedFonts;
			if(_o.html==false){tmp.text = _s;}else{tmp.htmlText = _s;}*/
			
			for(var i:String in _o){
				if(i!="html")tmp[i] = _o[i];
				}
			tmp.embedFonts = true;
			//if(_o.embedFonts==null){tmp.embedFonts = true;}
			if(_o.html==true){tmp.htmlText = _s;}else{tmp.text = _s;}
			
			//trace("[DynamicTextField] createTextField: "+tmp.text);
			tmp.antiAliasType = AntiAliasType.ADVANCED;
			return tmp;
		}
		public static function getTextFormat (_o:Object):TextFormat{
			var format:TextFormat = new TextFormat();
			
            format.font = _o.font;
            format.color = _o.color;
            format.size = _o.size;
            format.underline = _o.underline;
			
			format.align = _o.align;
			format.blockIndent = _o.blockIndent;
		
			format.bold = _o.bold;
			format.bullet = _o.bullet;
			format.italic = _o.italic;
				
			format.indent = _o.indent;
			format.kerning = _o.kerning;
			format.leading = _o.leading;

			format.letterSpacing = _o.letterSpacing;
			
			format.leftMargin = _o.leftMargin;
			format.rightMargin = _o.rightMargin;
			format.tabStops = _o.tabStops;
			format.target = _o.target;
			format.url = _o.url;
			//public var over:Object = 0xFFFFFF;
			
            return format;
		}
	}
}