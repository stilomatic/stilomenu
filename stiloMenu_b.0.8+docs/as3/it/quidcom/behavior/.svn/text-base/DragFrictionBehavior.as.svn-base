package it.quidcom.behavior
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import fl.motion.*;
	
	import it.quidcom.menu.*;
    
    /** 
	* The DragFrictionBehavior class, is the class to have a drag and drop behavior of any item of the menu.
	* Any item at the release status get an acceleration related to the mouse movement speed. 
	*  
	* @author Antonio Stilo
	*/
	public class DragFrictionBehavior extends DragBehavior
	{
			
		public function DragFrictionBehavior(_properties:Object=null)
		{			
			super(_properties);
		}
		override public function set target(_menu:AbstractMenu):void {
			var target:ItemCardAsset = ItemCardAsset(_menu);
		              
            target.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
            target.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
            //target.addEventListener(MouseEvent.MOUSE_OUT,mouseUpHandler);
          
        }
        override public function mouseDownHandler(evt:MouseEvent):void{
        	    var target:AbstractMenu
        	     = AbstractMenu(evt.currentTarget);
                target.startDrag ();
                target.extra.drag = true;
                target.extra.slide = false;
                target.extra.dragPos = new Point(target.parent.mouseX,target.parent.mouseY);
                target.extra.oldPosition = target.extra.dragPos;
                target.extra.position = target.extra.dragPos;
                target.extra.speedR = 0;
                 
            if(target.mouseX < 0 && target.mouseY < 0)target.extra.rad = 45;
            if(target.mouseX > 0 && target.mouseY < 0)target.extra.rad = -45;
            if(target.mouseX < 0 && target.mouseY > 0)target.extra.rad = 135;
            if(target.mouseX > 0 && target.mouseY > 0)target.extra.rad = -135;
                
                target.addEventListener(MouseEvent.MOUSE_MOVE,refresh);
                target.addEventListener(Event.ENTER_FRAME,chekRotation);
               
        }
        public function chekRotation(evt:Event):void{
        	
            var target:ItemCardAsset = ItemCardAsset(evt.currentTarget);
            var extra:Object = target.extra;
            extra.oldPosition = new Point(target.parent.mouseX,target.parent.mouseY);
            if(!extra.drag){
           
                if(target.x-(target.width/2) < 0)
                    extra.speedX *=-1;
                    //target.x = target.stage.stageWidth;
               if(target.y-(target.height/2) < 0)
                    extra.speedY *=-1;
                	//target.y = target.stage.stageHeight; 
                if(target.x+(target.width/2) > target.stage.stageWidth)
                    extra.speedX *=-1;
                    //target.x = 0;
               if(target.y+(target.height/2) > target.stage.stageHeight)
                    extra.speedY *=-1;
                    //target.y = 0; 
                  extra.speedX-= (extra.speedX)/6;
                  extra.speedY-= (extra.speedY)/6;
                  target.x += extra.speedX;
                  target.y += extra.speedY; 
                  
                  if(Math.round(extra.speedX)==0 && Math.round(extra.speedY)==0)
                    target.addEventListener(Event.ENTER_FRAME,chekRotation);
                  
            }else if(extra.drag){ 
            	
                
            	extra.dragPos = new Point(target.parent.mouseX,target.parent.mouseY);
                extra.speedX = (extra.oldPosition.x-extra.position.x);
                extra.speedY = (extra.oldPosition.y-extra.position.y);
                var dist:Number = extra.speedX;//Point.distance(extra.oldPosition,extra.position);
                //if(extra.position.x > extra.oldPosition.x)dist*=-1;
                if(target.mouseX < 0 && target.mouseY < 0)extra.rad = 45-(dist/8);
                if(target.mouseX > 0 && target.mouseY < 0)extra.rad = -45-(dist/8);
                if(target.mouseX < 0 && target.mouseY > 0)extra.rad = 135-(dist/8);
                if(target.mouseX > 0 && target.mouseY > 0)extra.rad = -135-(dist/8);
                
               // trace("Speed: "+extra.speedX+" : "+extra.speedY);
            }
            extra.srotation = Math.atan2 ((extra.dragPos.y  - evt.currentTarget.y), (extra.dragPos.x  - evt.currentTarget.x)) * (180 / Math.PI);
            extra.speedR = ((extra.speedR+extra.rad-(target.rotation))*2/3)/1.66;
          
            var m:Matrix = target.transform.matrix;          
            MatrixTransformer.rotateAroundExternalPoint(m,extra.dragPos.x,extra.dragPos.y,extra.speedR);
            target.transform.matrix = m;
            
            extra.position = extra.oldPosition;
        }
       override public function mouseUpHandler(evt:MouseEvent):void{
        	    var target:ItemCardAsset = ItemCardAsset(evt.currentTarget);
               target.stopDrag ();
               target.extra.drag = false;
               target.extra.slide = true;
               target.removeEventListener(MouseEvent.MOUSE_MOVE,refresh);
        }
       override public function refresh(evt:MouseEvent):void {
       	    var extra:Object = evt.currentTarget.extra;
       	    extra.dragPos = new Point(evt.currentTarget.parent.mouseX,evt.currentTarget.parent.mouseY);
            evt.updateAfterEvent();
        }

	}
}