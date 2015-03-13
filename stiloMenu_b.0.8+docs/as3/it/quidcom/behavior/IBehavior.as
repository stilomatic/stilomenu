package it.quidcom.behavior{
	
    import it.quidcom.menu.AbstractMenu;
	
	/** 
	* The IBehavior interface, is the interface for any behavior. 
	*  
	* @author Antonio Stilo
	*/
	public interface IBehavior{
		
		function get target():AbstractMenu;
		function set target(current:AbstractMenu):void;
		}
	}