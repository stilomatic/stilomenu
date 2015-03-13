package it.quidcom.menu.graphics
{
	import flash.display.Sprite;

	public class AbstractGraphic extends Sprite implements iGraphic
	{
		protected var selection:Boolean=false;
		
		public function AbstractGraphic()
		{
			super();
		}
		public function get selected ():Boolean{
			return selection;
		}
		
		public function set selected (value:Boolean):void{
			selection = value;
		}
		
		public function set label (value:String):void{
			
		}
	}
}