﻿package it.quidcom.styles{

	public class BackgroundStyle implements IStyle {

		public var over:uint = 0xCCCCCC;
		public var out:uint = 0xFF0000;

		public function BackgroundStyle(data:Object=null) {
			if (data!=null) {
				if (data.over != null) {
					over = parseInt(data.over);
				}
				if (data.out != null) {
					out = parseInt(data.out);
				}
			}
		}
		public function getStyle():Object {
			return Object(this);
		}
	}
}