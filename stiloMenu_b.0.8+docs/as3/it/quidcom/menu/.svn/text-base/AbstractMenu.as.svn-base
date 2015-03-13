package it.quidcom.menu{
	
	import flash.display.Sprite;
	import flash.xml.XMLNode;
	
	import it.quidcom.behavior.*;
	import it.quidcom.menu.graphics.*;
	import it.quidcom.styles.*;

	/**
 	* The AbstractMenu class, is the abstract class for any menu and items.
 	* 
 	* @author		Antonio Stilo - stilomatic
 	* @version		1.0
 	* @date 		12.09.2009
 	*
 	*/
	public class AbstractMenu extends Sprite implements IMenuItem {
		private var c:int = 0;
		/**
		* field - label of the menu or item.
 		* <p>Possible value is BasicLabel.</p>
 		*/
        public var field:AbstractGraphic;
		
		/**
		* list - generic Object to store variables (ususaly stores the Xml Node attributes for the menu/item).
 		* <p>Possible values is Object.</p>
 		*/
		protected var list:Object;
		
		/**
		* extra - generic Object to store variables (useful for animations).
 		* <p>Possible value is Object.</p>
 		*/
		public var extra:Object = {};
		
		/**
		* selection - boolean variable to store if the menu / item has been selected.
 		* <p>Default value <code>false</code>.</p>
 		*/
		protected var selection:Boolean=false;
		
		/**
		* space - gap space between the items in the menu.
 		* <p>Default value <code>2</code> pixels.</p>
 		*/
		protected var space:int=2;
		
		public function AbstractMenu() {
			super();
			tabChildren = false;
		}
		
		/** 
		* Is a method as constructor for all the menues and items classes that extend the <code>AbstractMenu</code>. 
		* This method is called by the <code>MenuBuilder</code>. 
		* 
		* @param data <code>XMLNode</code> the Xml node to pass data to the object.
		* @param stylesBuilder <code>StyleBuilder</code> manage the styles.
		* @param behaviorsBuilder <code>BehaviorBuilder</code> manage the behaviors.
		* @return void 
		*/ 
		public function init(data:XMLNode,stylesBuilder:StyleBuilder,behaviorsBuilder:BehaviorBuilder):void{
          
          list = data.attributes;
          
          if(list.space!=null)space = int(list.space);
          if(list.x!=null) this.x = Number(list.x);
          if(list.y!=null) this.y = Number(list.y);
          if(list.name!=null) this.name = String(list.name);
          
          setBehaviors(behaviorsBuilder);
          
        }
        
        /** 
		* Populate the menu with any kind of items.
		* 
		* @param item <code>AbstractMenu</code> the item.
		* 
		* @return void 
		*/
		public function addItem(item:AbstractMenu):void {
		}
		
		/** 
		* Set the string value of label of the item.
		* 
		* @param value <code>String</code> the string value to be setted.
		* 
		* @return void 
		*/  
		public function set label(value:String):void{
                field.label = value;
        }
        
        /** 
		* Get the boolean value of selected state of the item.
		* 
		* @return Boolean 
		*/
		public function get selected():Boolean {
			return selection;
		}
		
		/** 
		* Set the boolean value of selected state of the item.
		* 
		* @param value <code>Boolean</code> the boolean value to be setted.
		* 
		* @return Boolean 
		*/
		public function set selected(value:Boolean):void {
			selection=value;
			var i:uint = 0;
			for(i=0; i<this.numChildren;i++)
				AbstractMenu(this.getChildAt(i)).selected = selection;
		}
		
		/** 
		* Get the Object item properties. Related to the Xml Node attributes.
		* 
		* @return Object 
		*/
		public function get data():Object {
            return list;
        }
        
        
		/** 
		* Set the Object to store item properties. Related to the Xml Node attributes.
		* 
		* @param prop <code>Object</code> the object value to be setted.
		* 
		* @return void 
		*/
        public function set data(prop:Object):void {
            list = prop;
        }
        
        /** 
		* Set the item unclickable.
		* 
		* @return void 
		*/  
        public function deactivate():void{
			var i:int;
			for(i=0;i < this.numChildren;i++){
				var tmp:AbstractMenu = AbstractMenu(this.getChildAt(i));
				tmp.deactivate();
			}
		}
		
		/** 
		* Set the item clickable.
		* 
		* @return void 
		*/
		public function activate():void{
			var i:int;
			for(i=0;i < this.numChildren;i++){
				var tmp:AbstractMenu = AbstractMenu(this.getChildAt(i));
				tmp.activate();
			}
		}
		
		/** 
		* Add behaviors to the menu/item.
		* 
		* @param behaviorsBuilder <code>BehaviorBuilder</code> the factory object for the bahaviors.
		* 
		* @return void 
		*/
		protected function setBehaviors(behaviorsBuilder:BehaviorBuilder):void{
			
			if (( data.behaviors != "" && data.behaviors != undefined ) && behaviorsBuilder != null) {
				
				var currentBehavior:AbstractBehavior;
				
				if(String(data.behaviors).indexOf(",") != -1){
					var behaviorFlags:Array = String(data.behaviors).split(",");
					for(var i:String in behaviorFlags){
						currentBehavior = behaviorsBuilder.getBehavior(behaviorFlags[i]);
						currentBehavior.target = this;
					}
				}else{
					currentBehavior = behaviorsBuilder.getBehavior(data.behaviors);
					currentBehavior.target = this;
				}
				
			}
		}
	}
}