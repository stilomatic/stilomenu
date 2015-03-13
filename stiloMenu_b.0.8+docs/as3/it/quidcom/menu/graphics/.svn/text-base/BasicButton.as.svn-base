package it.quidcom.menu.graphics{
	
	import flash.display.Sprite;
	
	public class BasicButton extends Sprite{
		
		private var selection:Boolean=false;
		private var myWidth:int=200;
		private var myHeight:int=20;
		private var onColor:uint=0x000000;
		private var outColor:uint=0x000000;
		
		public function BasicButton (stile:Object=null,o:Object=null){
			super();
			if(stile != null){
			 onColor = stile.over;
			 outColor = stile.out;
			}
			if(o != null){myWidth = o.width; myHeight = o.height;}
			drawMe(outColor);
			}
		public function get selected ():Boolean{
			return selection;
			}
		public function set selected (value:Boolean):void{
			selection = value;
			if(selection){
				drawMe(onColor);
				}else{
				drawMe(outColor);	
			}
		}
		public function resize(value:uint):void{
			myWidth = value;
			if(selection){
				drawMe(onColor);
				}else{
				drawMe(outColor);	
			}
		}
		
		private function drawMe(bgColor:uint):void{
			
			this.graphics.clear();
            this.graphics.beginFill(bgColor);
            this.graphics.drawRect(0, 0, myWidth, myHeight);
            this.graphics.endFill();
			
			}
		
		}
	}