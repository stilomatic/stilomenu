package it.quidcom.xml
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.*;
	import flash.xml.XMLDocument;
	
	public final class LoaderXml
	{
		
		private var xmlUrl:String;
		private var myLoader:URLLoader;
		private var dataHolder:Function;
		
		public function LoaderXml(url:String,callBack:Function,params:Object=null){
			super();
			xmlUrl = url;
			trace("[LoaderXml] "+xmlUrl);
			dataHolder = callBack;
			var myXMLURL:URLRequest = new URLRequest(xmlUrl);
			
			if(params!=null){
				myXMLURL.method = URLRequestMethod.GET;
				
				var variables:URLVariables = new URLVariables();
				for(var i:String in params){
					variables[i] = params[i];
				}
         		myXMLURL.data = variables;
				trace("[LoaderXML Query] "+ variables.toString());
			}
            myLoader = new URLLoader();
            myLoader.dataFormat = URLLoaderDataFormat.TEXT;
			try{
				myLoader.load(myXMLURL);
			}catch (e:Error){
				trace("CANT LOAD XML: "+e);
				}
			
			myLoader.addEventListener (Event.COMPLETE, xmlLoaded);
			myLoader.addEventListener (IOErrorEvent.IO_ERROR, ioErrorHandler);
		
		}
		
		private function xmlLoaded (event:Event):void {

			var myXML:XMLDocument = new XMLDocument();
			myXML.ignoreWhite = true;
			myXML.parseXML (myLoader.data);
			
			dataHolder(myXML);
		
		}

		private function ioErrorHandler (event:IOErrorEvent):void {
			trace ("[LoaderXml] ioErrorHandler: " + event);
		}

	}
}