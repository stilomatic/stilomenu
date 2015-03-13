package it.quidcom.menu
{
    import caurina.transitions.Tweener;
    
    import flash.xml.XMLNode;
    
    import it.quidcom.behavior.*;
    import it.quidcom.manager.LoaderAdapter;
    import it.quidcom.menu.graphics.*;
    import it.quidcom.styles.*;

	/**
 	* The ItemCardAsset class is an item that could load an external image.
 	* 
 	* @author		Antonio Stilo - stilomatic
 	* @version		1.0
 	* @date 		03.09.2009
 	*
 	* @example To create a menu with <code>CardAssetItem</code> as buttons write in the xml file after the <styles> and <behaviors> nodes the following xml:
 	
 	 <item classType="it.quidcom.menu.MenuGrid" x="50" y="50" space="88" module="3" behaviors="selected" >
     <kids>
       <item classType="it.quidcom.menu.CardAssetItem" styles="textStyle,background" behaviors="alphaAnim" id="0" img="./imgs/test.jpg" label="MODELLO 01" />
	   <item classType="it.quidcom.menu.CardAssetItem" styles="textStyle,background" behaviors="alphaAnim" id="1" img="./imgs/test.jpg" label="MODELLO 02" />
      	<item classType="it.quidcom.menu.CardAssetItem" styles="textStyle,background" behaviors="alphaAnim" id="2" img="./imgs/test.jpg" label="MODELLO 03" />
      	<item classType="it.quidcom.menu.CardAssetItem" styles="textStyle,background" behaviors="alphaAnim" id="3" img="./imgs/test.jpg" label="MODELLO 04" />
      	<item classType="it.quidcom.menu.CardAssetItem" styles="textStyle,background" behaviors="alphaAnim" id="4" img="./imgs/test.jpg" label="MODELLO 05" />
     </kids>
	 </item>
 	*/
	public class ItemCardAsset extends AbstractMenu
	{
	   protected var stylesBuilder:StyleBuilder;
	   protected var behaviorsBuilder:BehaviorBuilder;
       protected var background:BasicButton;
       protected var img:LoaderAdapter;
       protected var sport:BasicLabel;

        public function ItemCardAsset() {
            
            super();
            alpha = 0;
        }
        
        /** 
		* Is a method that we use as constructor for all the classes that extends the <code>AbstractMenu</code>. 
		* This method is called by the <code>MenuBuilder</code>.. 
		* 
		* @param data <code>XMLNode</code> the Xml node to pass data to the object.
		* @param stylesBuilder <code>StyleBuilder</code> manage the styles.
		* @param behaviorsBuilder <code>BehaviorBuilder</code> manage the behaviors.
		* @return void 
		*/  
        override public function init(data:XMLNode,_stylesBuilder:StyleBuilder,_behaviorsBuilder:BehaviorBuilder):void {

            list = data.attributes;
            
            this.stylesBuilder = _stylesBuilder;
            this.behaviorsBuilder = _behaviorsBuilder;
            img = new LoaderAdapter(list.img ,true ,placeGrafix);
         }
         
       /** 
		* Build up the grafic asset of the item at the end of the loding of the external image. 
		* This method is called by the <code>LoaderAdapter</code> in the init method. 
		* 
		* @return void 
		*/    
       	public function placeGrafix():void{
     	
           var styleFlags:Array = list.styles.split(",");
           
           background = new BasicButton(Object(stylesBuilder.getStyle(styleFlags[0]).getStyle()),{width:img.width+4,height:img.height+4});
           background.x = -2; background.y = -2;
           addChild(background);
           addChild(img);
           
           setBehaviors(behaviorsBuilder);
            
           var w:int = background.width/2;
           var h:int = background.height/2;
            
          	this.img.x -= w; this.img.y -= h;
          	this.background.x -= w; this.background.y -= h;
            Tweener.addTween(this,{alpha:1,time:.1,transition:"linear",onComplete:trasform});
            
       }
       protected function trasform():void{
       
       }
       
        /** 
		* Get the selection status of the item.
		* 
		* @return Boolean 
		*/
        override public function get selected():Boolean {
            return selection;
        }
        
        /** 
		* Set the selected status of the item.
		* 
		* @param value <code>Boolean</code> if the item is selected or not.
		* @return void 
		*/
        override public function set selected(value:Boolean):void {
        	
            selection = value;
            if (selection) {
                background.selected = true;
            } else {
                background.selected = false;
            }

        }
  
	}
}