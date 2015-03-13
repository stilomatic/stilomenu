package it.quidcom.menu{
	
	/** 
	* The IMenuItem interface, the interface for <code>AbstractMenu</code> class.
	*
	* 
	* 
	* @author Antonio Stilo
	*/
	public interface IMenuItem {
		function addItem(item:AbstractMenu):void;
		function get selected():Boolean;
		function set selected(value:Boolean):void;
		}
	}