package it.quidcom.manager{
	
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.events.*;
	import flash.errors.IOError;
	import flash.net.URLRequest;
	
	import it.quidcom.gui.Preloader;

	public class LoaderAdapter extends Loader {
		private var url:String;
		private var manager:Boolean;
		private var callBack:Function;
		private var preLoader:Preloader;

		public function LoaderAdapter (_url:String,_manager:Boolean = false,_callBack:Function = null,_preLoader:Preloader = null) {
			super();
			
			url = _url;
			manager = _manager;
			callBack = _callBack;
			preLoader = _preLoader;
			configureListeners (this.contentLoaderInfo);

			this.mouseEnabled = false;

			if (!manager)
			{
				startLoading ();
			} else
			{
				if (!AssetsManager.started)
				{
					AssetsManager.start ();
					AssetsManager.record (this);
					AssetsManager.load ();
				} else
				{
					AssetsManager.record (this);
				}
			}

		}
		public function startLoading ():void {
			try
			{
				var request:URLRequest = new URLRequest(url);
				load (request);
				if (manager && AssetsManager.started)addEventListener(Event.REMOVED_FROM_STAGE,stopAsset);
				if (preLoader != null)
				{
					preLoader.show = true;
				}
			}
			catch (error:Error)
			{
				trace ("[LoaderAdapter] loading failed "+error.toString());
			}
		}
		private function stopAsset(evt:Event):void{
			trace ("[LoaderAdapter] stopAsset "+AssetsManager.started);
			AssetsManager.init ();
			}
		private function configureListeners (dispatcher:IEventDispatcher):void {
			dispatcher.addEventListener (Event.COMPLETE, completeHandler);
			dispatcher.addEventListener (HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.addEventListener (Event.INIT, initHandler);
			dispatcher.addEventListener (IOErrorEvent.IO_ERROR, ioErrorHandler);
			dispatcher.addEventListener (Event.OPEN, openHandler);
			dispatcher.addEventListener (ProgressEvent.PROGRESS, progressHandler);
			dispatcher.addEventListener (Event.UNLOAD, unLoadHandler);
		}

		private function completeHandler (event:Event):void {
			if (callBack!=null)
			{
				callBack ();
			}
			if (preLoader != null)
			{
				preLoader.show = false;
			}
			if (AssetsManager.started && manager)
			{
				AssetsManager.load ();
				removeEventListener(Event.REMOVED_FROM_STAGE,stopAsset);
			}
			if(content is Bitmap){
		      	Bitmap(this.content).smoothing = true;
			}
			
		}
		public function stopLoading ():void {
			close();
			if (manager && AssetsManager.started)AssetsManager.init ();

			if (preLoader != null)
			{
				preLoader.show = false;
			}
		}
		private function httpStatusHandler (event:HTTPStatusEvent):void {
			
		}

		private function initHandler (event:Event):void {
			
		}

		private function ioErrorHandler (event:IOErrorEvent):void {
			
		}

		private function openHandler (event:Event):void {
			
		}

		private function progressHandler (event:ProgressEvent):void {
			
			var percent:Number = (event.bytesLoaded/event.bytesTotal);
			if (preLoader != null)
			{
				preLoader.value = percent;
			}
		}

		private function unLoadHandler (event:Event):void {
			
		}

		private function clickHandler (event:MouseEvent):void {
	
		}
	}
}