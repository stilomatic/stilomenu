package it.quidcom.gui
{
	import caurina.transitions.Tweener;
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
    
    public class Scroll extends MovieClip
    {
        private var rect:Rectangle;
        private var myTarget:DisplayObject;
        private var myOwner:Sprite;
        private var corsa:int;
        private var start:int;
        private var itemH:int;
        
        public function Scroll(scrollOwner:Sprite,target:DisplayObject,_h:int,itemHeight:int=0){
            super();
            itemH = itemHeight;
            myOwner = scrollOwner;
            myTarget = target;
            bckMc.height = _h; 
            corsa = bckMc.height-this.cursorMc.height;
            start = int(myTarget.y);
            
            rect = new Rectangle();
            rect.top = 0;
            rect.bottom = corsa;
            rect.left = cursorMc.x;
            rect.right = cursorMc.x;
            
            cursorMc.buttonMode=true;
            cursorMc.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDownHandler);
            cursorMc.addEventListener(MouseEvent.MOUSE_UP,onMouseUpHandler);
            cursorMc.addEventListener(MouseEvent.ROLL_OUT,onMouseUpHandler);
             
        }
        public function onMouseDownHandler(event:MouseEvent):void{

             var sprite:Sprite = Sprite(event.target);
            sprite.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            sprite.startDrag(false,rect);
        }
        public function onMouseUpHandler(event:MouseEvent):void{

             var sprite:Sprite = Sprite(event.target);
            sprite.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
            sprite.stopDrag();
        }
        public function mouseMoveHandler(event:MouseEvent):void {
        	
             var pos:Number = start-((this.cursorMc.y/corsa)*(this.myTarget.height-bckMc.height-itemH));
            Tweener.addTween(this.myTarget,{y:pos,time:0.5,transition:"easeOutQuad"});
           // trace(this.myTarget.height+" : "+pos);
            event.updateAfterEvent();
        }
        
        
    }
}