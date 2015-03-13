package it.quidcom.menu.graphics
{
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    
    import it.quidcom.utils.ColorManager;
    
	public class McButton extends MovieClip
	{
		private var selection:Boolean=false;
        private var onColor:uint=0xFFFFFF;
        private var outColor:uint=0x000000;
        
		public function McButton()
		{
			super();
			
		}
		public function set style(stile:Object):void
		{
                onColor = stile.over;
                outColor = stile.out;
		}
        public function get selected ():Boolean{
            return selection;
        }
        public function set selected (value:Boolean):void{
            selection = value;
            if(selection){
            	
            	ColorManager.setRGB(DisplayObject(this),onColor);
                }else{
                ColorManager.setRGB(DisplayObject(this),outColor);   
            }
        }
	}
}