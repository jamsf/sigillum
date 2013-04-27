package net.mnml.entities.persons 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	import net.mnml.entities.ui.PopupText;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class NPC extends Person 
	{
		[Embed(source = '/../assets/sprites/spr_npc.png')] private const PERSON_NPC:Class;
		
		public var popupText	:PopupText;
		
		public function NPC(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			popupText = new PopupText(this);
			FP.world.add(popupText);
			
			graphic = new Image(PERSON_NPC);
			setHitbox(64, 64);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (collide("Player", x, y) != null)
			{
				popupText.startTextRead();
			}
		}
	}

}