package it.quidcom.manager
{
	
	internal class AssetsManager
	{
		public static var started:Boolean = false;
		private static var que:Array = new Array();
		private static var id:int = 0;
		
		public static function init():void{
			started = false;
			que = new Array();
			id = 0;
		}
		public static function start():void{
			started = true;
		}
		public static function record(ml:LoaderAdapter):void{
			que.push(ml);	
		}
		public static function load():void{
			if(id<que.length){
				que[id].startLoading();
				id++;
			}else{
				init();
			}
		}
		
		
	}
}