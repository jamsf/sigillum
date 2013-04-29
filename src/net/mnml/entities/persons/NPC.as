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
		
		private var origX: int;
		private var origY: int;
		
		public function NPC(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			origX = x;
			origY = y;
			
			popupText = new PopupText(this, new Array(
												"You look pale. Are you sick?",
												"You need to leave, now.",
												"Are you going to the mountain?",
												"You need to leave, now.",
												"Did you make the sun turn red?",
												"You're going to kill us, aren't you?",
												"Why has the sun turned red?",
												"Please, leave us be.",
												"You look sick.",
												"You've come all this way to murder us?",
												"Why are you doing this?",
												"Please, don't go to the mountains.",
												"The sun! You made it red as blood!",
												"I can see death in your eyes."
												));
			FP.world.add(popupText);
			
			graphic = new Image(PERSON_NPC);
			setHitbox(128, 128);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (collide("Player", x, y) != null)
			{
				popupText.startTextRead();
			}
			
			var jumpX:Number = (Math.random() * 2 - 1);
			var jumpY:Number = (Math.random() * 2 - 1);
			
			x = origX + jumpX;
			y = origY + jumpY;
		}
	}

}