﻿package it.quidcom.menu{	import flash.utils.getDefinitionByName;	import flash.xml.*;		import it.quidcom.behavior.BehaviorBuilder;	import it.quidcom.styles.StyleBuilder;			public class MenuBuilder {		private static  var stile:StyleBuilder;		private static  var behavior:BehaviorBuilder;		private static  var myMenu:AbstractMenu;		// Register		private var m0:MenuHorizontal;        private var m1:MenuVertical;        private var m3:MenuRandom;        private var m4:MenuUpVertical;        private var m5:DropDownMenu;        private var m6:MenuGrid;                private var i0:BasicItem;        private var i1:CardAssetItem;        private var i2:DropDownItem;		public function MenuBuilder(data:XMLNode) {			super();			var childs:Array = data.childNodes;			for each (var i in childs) {				if (i.nodeName == "styles") {									if (i.hasChildNodes()) {										stile = new StyleBuilder(i);					} else {										var defaultStyle:XML = <styles>													<style classType="it.quidcom.styles.TextStyle" id="textStyle"> 														<property font="Verdana" size="12" bold="true" italic="true" over="0x000000" out="0xFFFFFF" /> 													</style> 													<style classType="it.quidcom.styles.BackgroundStyle" id="background"> 														<property over="0xCCCCCC" out="0x222222" /> 													</style> 												</styles>;						var xml:XMLDocument = new XMLDocument();xml.ignoreWhite = true;xml.parseXML(defaultStyle.toString());						stile = new StyleBuilder (xml.firstChild);									}				} else if (i.nodeName == "behaviors") {									if (i.hasChildNodes()) {										behavior = new BehaviorBuilder(i);					} else {										behavior = null;						}				} else if (i.nodeName == "item") {									myMenu = buildMenu(i);				}			}		}		public function get menu():AbstractMenu {			return myMenu;		}		private function buildMenu(data:XMLNode):AbstractMenu {			var ClassReference:Class = Class(getDefinitionByName(data.attributes.classType));			var instance:Object = new ClassReference();			instance.init(data,stile,behavior);			populateMenu(data,AbstractMenu(instance));			return AbstractMenu(instance);		}		private function populateMenu(data:XMLNode,instance:AbstractMenu):void {			if (data.hasChildNodes()) {				var nodes:Array = data.childNodes;				for each (var item:XMLNode in nodes) {					if (item.nodeName == "kids") {						for each (var menuItem:XMLNode in item.childNodes) {							instance.addItem(buildMenu(menuItem));													}					}				}			}		}	}}