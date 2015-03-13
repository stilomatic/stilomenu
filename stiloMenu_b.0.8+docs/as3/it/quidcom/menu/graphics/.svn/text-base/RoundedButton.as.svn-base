package it.quidcom.menu.graphics
{
    import flash.display.Shape;
    import flash.display.Sprite;

	public class RoundedButton extends Sprite
	{
		private const round:int = 30;
        private var selection:Boolean=false;
        private var myWidth:int=200;
        private var myHeight:int=20;
        private var onColor:uint;
        private var outColor:uint;
        
        public function RoundedButton (stile:Object,o:Object=null){
            super();
            onColor = stile.over;
            outColor = stile.out;
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
        private function drawMe(bgColor:uint):void{
            this.graphics.clear();
            this.graphics.beginFill(bgColor);
            this.graphics.drawRoundRect(0,0,myWidth,myHeight,round,round);
            this.graphics.endFill();
            }
        
        }
		
	}