﻿package it.quidcom.gui{

	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	
	public class Preloader extends MovieClip{
		
		private var display:SimpleByteDisplay;
		private var prop:String;
		private var barMc:PreloaderBar;
		
		public function Preloader(property:String=null,displayPosition:Object=null,textObject:Object=null,textStyle:Object=null){
			super();
			barMc = new PreloaderBar();
			barMc.y = -barMc.height/2;
			addChild(barMc);
			mouseEnabled = false;
			visible = false;
			alpha = 0;
			if(property==null){prop="scaleX";}else{prop = property;};
			if(displayPosition==null)displayPosition={x:0,y:12};
			display = new SimpleByteDisplay(textObject,textStyle);
			display.x = displayPosition.x; display.y = displayPosition.y;
			addChild(display);
		
		}
		public function set label (_s:String):void{
			if(_s == ""){
				removeChild(display);
			}else{
				display.label = _s;
			}
			}
		public function get label ():String{
				if(display!=null)
					return display.label;
				else
					return "";
			}
		public function set value(n:Number):void{
				barMc[prop] = n;
				if(display!=null)
				display.value = Math.ceil(n*100);
			}
		public function get value():Number{
				return barMc[prop];
			}
		public function get show():Boolean{
			
			return this.visible; 
			
			}
		public function set show(b:Boolean):void{
			
			if(b){
				visible = b;
				alpha=0;
				Tweener.addTween(this,{alpha:1,time:1});
				}else{
				Tweener.addTween(this,{alpha:0,time:1,onComplete:function():void{visible=false;}});
			}
			}
		}
	
	}