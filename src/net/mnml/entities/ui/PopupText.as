package net.mnml.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author jams
	 */
	public class PopupText extends Entity
	{
		private var text			:Text;
		private var possStrs		:Array;
		private var owner			:Entity;
		
		public function PopupText(owner:Entity, possStrs:Array)
		{
			this.owner = owner;
			this.possStrs = possStrs;
			text = new Text("null", owner.x - 64, owner.y - 64, {"alpha":0} );
		}
		
		public 
		override public function update():void 
		{
			super.update();
			
			text.x = owner.x - 64;
			text.y = owner.y - 64;
		}
	}

}