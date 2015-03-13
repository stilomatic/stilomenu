﻿package it.quidcom.styles{
	
	public class TextStyle implements IStyle{
		
		public var align:String = "left";
		public var blockIndent:Object = 0;
		
		public var bold:Object = false;
		public var bullet:Object = false;
		public var italic:Object = false;
				
		public var color:Object = 0x000000;
		public var out:Object = color;
		public var over:Object = 0xFFFFFF;
		public var font:String = "Verdana";
		public var indent:Object = 0;

		public var kerning:Object = false;
		public var leading:Object = 0;
		public var leftMargin:Object = 0;
		public var letterSpacing:Object = 0;
		public var rightMargin:Object = 0;
		public var size:Object = 44;
		public var tabStops:Array = [];
		public var target:String = "";
		public var underline:Object = false
		public var url:String = "";
		
		/** 
		* The TextStyle class, manage a text format style. 
		*  
		* @param data <code>Object</code> the object store all the text format.
		* @author Antonio Stilo
		*/
		public function TextStyle(data:Object=null){
			if(data!=null){
			if(data.align != null) 			align = data.align;
			if(data.blockIndent != null)	blockIndent = Object(data.blockIndent);
			if(data.bold != null) 			bold = Boolean(data.bold);
			if(data.bullet != null) 		bullet = Object(Boolean(data.bullet));
			if(data.font != null)			font = data.font;
			if(data.indent != null) 		indent = Object(data.indent);
			if(data.italic != null) 		italic = Boolean(data.italic);
			if(data.kerning != null) 		kerning = Object(data.kerning);
			if(data.leading != null)		leading = Object(data.leading);
			if(data.leftMargin != null)		leftMargin = Object(data.leftMargin);
			if(data.letterSpacing != null)	letterSpacing = Object(data.letterSpacing);
			if(data.rightMargin != null)	rightMargin = Object(data.rightMargin);
			if(data.size != null)			size = Object(parseInt(data.size));
			if(data.tabStops != null)		tabStops = data.tabStops.split(",");
			if(data.target != null)			target = String(data.target);
			if(data.underline != null)		underline = Object(data.underline);
			if(data.url != null)			url = data.url;
			
			if(data.out != null)			color = Object(parseInt(data.out));
			if(data.over != null)			over = Object(parseInt(data.over));
			}
			
		}
		public function getStyle():Object{
				var b:Object = Object(this);
				return b;
			}
		}
	}