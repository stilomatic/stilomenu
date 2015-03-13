package it.quidcom.menu
{
    import caurina.transitions.Tweener;
    
    import flash.xml.XMLNode;
    
    import it.quidcom.manager.LoaderAdapter;
    import it.quidcom.behavior.*;
    import it.quidcom.styles.*;
    
   	import it.quidcom.menu.graphics.*;

	public class CardAssetItem extends AbstractMenu
	{
	   protected var stile:StyleBuilder;
	   protected var behavior:BehaviorBuilder;
       protected var background:BasicButton;
       protected var img:LoaderAdapter;
       protected var sport:BasicLabel;

        public function CardAssetItem() {
            
            super();
            alpha = 0;
            buttonMode = true;
        }
        override public function init(data:XMLNode,stile:StyleBuilder,behavior:BehaviorBuilder):void {
        	//trace("[CardAssetItem] init "+data.attributes.img); 
            list = data.attributes;
            
            this.stile = stile;
            this.behavior = behavior;
            img = new LoaderAdapter(list.img,true,placeGrafix);
         }
       public function placeGrafix():void{
        //    trace("[CardAssetItem] placeGrafix");       	
            var styleFlags:Array = list.style.split(",");
           
           background = new BasicButton(Object(stile.getStyle(styleFlags[0]).getStyle()),{width:img.width+4,height:img.height+4});
           background.x = -2; background.y = -2;
           addChild(background);
           addChild(img);
           
            if (list.behavior!=null || list.behavior=="") {
                var behavesFlags:Array = list.behavior.split(",");
                for(var i in behavesFlags){
                 var behaviorFlag:String = behavesFlags[i];
                 var currentBehavior:AbstractBehavior = behavior.getBehavior(behaviorFlag);
                    currentBehavior.target = this;
                }
            }
             var w:int = background.width/2;
            var h:int = background.height/2;
            
            this.img.x -= w; this.img.y -= h;
            this.background.x -= w; this.background.y -= h;
            Tweener.addTween(this,{alpha:1,time:.1,transition:"linear",onComplete:trasform});
       }
       protected function trasform():void{
       
       }
       
        
        override public function get selected():Boolean {
            return selection;
        }
        override public function set selected(value:Boolean):void {
        	//trace("[CardAssetItem] selected:"+value);
            selection = value;
            if (selection) {
                background.selected = true;
            } else {
                background.selected = false;
            }

        }
	}
}