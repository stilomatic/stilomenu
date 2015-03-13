package it.quidcom.behavior{
	
	import flash.utils.getDefinitionByName;
	import flash.net.registerClassAlias;
	import flash.xml.*;
	
	public class BehaviorBuilder{	
	
	private var behaviours:Array = [];
	// Register Classes

    private var n0:AlphaBehavior; 
    private var n1:DragBehavior; 
    private var n2:LabelToggle;
    private var n3:ZSortBehavior;
    private var n5:TendToPointBehavior;
    private var n6:SelectedBehavior;
    private var n7:DragFrictionBehavior;

	/** 
	* The BehaviorBuilder class, is the factory class for any behavior. 
	*  
	* @author Antonio Stilo
	*/
	public function BehaviorBuilder(data:XMLNode){
            //trace("[BehaviorBuilder] StyleData: "+data);            
			var childs:Array = data.childNodes;
			for each(var item:XMLNode in childs){
				//trace("[BehaviorBuilder] kid: "+item);
				registerClassAlias(item.attributes.classType,Class(getDefinitionByName(item.attributes.classType)));
				var ClassReference:Class = Class(getDefinitionByName(item.attributes.classType));
				var instance:Object = new ClassReference(item.firstChild.attributes);
          	 	behaviours[item.attributes.id] = AbstractBehavior(instance);
			}
		
		}
		
		/** 
		* Is a generic method that return the correct behavior from the behaviors dictonary. 
		* 
		* @param id <code>String</code> the identifier for the behavior.
		* @return AbstractBehavior 
		*/  
		public function getBehavior(id:String):AbstractBehavior{
	
			return behaviours[id];
		
		}	
	}
}