package it.quidcom.menu
{
	import it.quidcom.menu.AbstractMenu;

	public class CardItem extends AbstractMenu
	{
		public function CardItem()
		{
			super();
		}
		override public function init(data:XMLNode,stile:StyleBuilder,behavior:BehaviorBuilder):void {
            list = data.attributes;
            var styleFlags:Array = data.attributes.style.split(",");
            if (data.attributes.behavior!=null || data.attributes.behavior=="") {
                var behaviorFlag:String = data.attributes.behavior;
                var currentBehavior:AbstractBehavior = behavior.getBehavior(behaviorFlag);
                currentBehavior.target = this;
            }
            var currentStile:Object = Object(stile.getStyle(styleFlags[0]).getStyle());
            field = new BasicLabel (list.label,currentStile);
            background = new BasicButton(Object(stile.getStyle(styleFlags[1]).getStyle()),{width:field.width,height:field.height});
            addChild(background);
            addChild(field);
        }
		
	}
}