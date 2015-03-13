package it.quidcom.styles{
	
	import flash.xml.*;
	import flash.utils.getDefinitionByName;
	import flash.net.registerClassAlias;
	
	public class StyleBuilder{	
	
	private var styleList:Array = [];

	/** 
	* The StyleBuilder class, is the factory class for any style object. 
	*  
	* @param data <code>XMLNode</code> the Xml node to pass data to the object.
	* @author Antonio Stilo
	*/
	public function StyleBuilder(data:XMLNode){
			//trace("[StyleBuilder] StyleData: "+data);
			
			var n:TextStyle = new TextStyle(); 
			var n1:BackgroundStyle = new BackgroundStyle();
			
			var childs:Array = data.childNodes;
			for each(var item:XMLNode in childs){
				//trace("[StyleBuilder] kid: "+item);
				registerClassAlias(item.attributes.classType,Class(getDefinitionByName(item.attributes.classType)));
				var ClassReference:Class = Class(getDefinitionByName(item.attributes.classType));
				var instance:Object = new ClassReference(item.firstChild.attributes);
          	 	styleList[item.attributes.id] = IStyle(instance);
			}
		
		}
		
		/** 
		* Is a generic method that return the correct styles object from the styles dictonary. 
		* 
		* @param id <code>String</code> the identifier for the style.
		* @return IStyle 
		*/
		public function getStyle(id:String):IStyle{
	
			return styleList[id];
		
		}	
	}
}