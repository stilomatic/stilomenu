package it.quidcom.menu{

	import flash.utils.getDefinitionByName;
	import flash.xml.*;
	
	import it.quidcom.behavior.BehaviorBuilder;
	import it.quidcom.styles.StyleBuilder;
	
	/** 
	* The MenuBuilder class, is a the factory for all the menues. 
	* Also regist the classes, for any menues and items.
	* 
	* @author Giovanni Stilo, Antonio Stilo
	*/
	public class MenuBuilder {

		private static  var styleBuilder:StyleBuilder;
		private static  var behaviorBuilder:BehaviorBuilder;
		private static  var myMenu:AbstractMenu;
		/// Register
		private var m0:MenuHorizontal;
		private var m1:MenuHorizontalReversed;
        private var m2:MenuVertical;
        private var m3:MenuVerticalReversed;
        private var m4:MenuDropDown;
        private var m5:MenuRandom;
        private var m6:MenuGrid;
        
        private var i0:Item;
        private var i1:ItemReversed;
        private var i2:ItemSpacer;
        private var i3:ItemSpacerReversed;
        private var i4:ItemDropDown;
        private var i5:ItemDropDownReversed;
        private var i6:ItemCard;
        private var i7:ItemCardAsset;


		public function MenuBuilder(data:XMLNode) {
			super();
			var childs:Array = data.childNodes;
			for each (var i:XMLNode in childs) {

				if (i.nodeName == "styles") {
				
					if (i.hasChildNodes()) {
				
						styleBuilder = new StyleBuilder(i);
					} else {
				
						var defaultStyle:XML = <styles>
													<style classType="it.quidcom.styles.TextStyle" id="textStyle"> 
														<property font="Verdana" size="12" bold="true" italic="true" over="0x000000" out="0xFFFFFF" /> 
													</style> 
													<style classType="it.quidcom.styles.BackgroundStyle" id="background"> 
														<property over="0xCCCCCC" out="0x222222" /> 
													</style> 
												</styles>;
						var xml:XMLDocument = new XMLDocument();xml.ignoreWhite = true;xml.parseXML(defaultStyle.toString());
						styleBuilder = new StyleBuilder (xml.firstChild);
				
					}
				} else if (i.nodeName == "behaviors") {
				
					if (i.hasChildNodes()) {
				
						behaviorBuilder = new BehaviorBuilder(i);
					} else {
				
						behaviorBuilder = null;
						}
				} else if (i.nodeName == "item") {
				
					myMenu = buildMenu(i);
				}
			}
		}
		public function get menu():AbstractMenu {
			return myMenu;
		}
		private function buildMenu(data:XMLNode):AbstractMenu {
			var ClassReference:Class = Class(getDefinitionByName(data.attributes.classType));

			var instance:Object = new ClassReference();
			instance.init(data,styleBuilder,behaviorBuilder);
			populateMenu(data,AbstractMenu(instance));
			return AbstractMenu(instance);
		}
		private function populateMenu(data:XMLNode,instance:AbstractMenu):void {

			if (data.hasChildNodes()) {
				var nodes:Array = data.childNodes;
				for each (var item:XMLNode in nodes) {
					if (item.nodeName == "kids") {
						for each (var menuItem:XMLNode in item.childNodes) {

							instance.addItem(buildMenu(menuItem));
							
						}
					}
				}
			}
		}
	}
}