package net.mnml.entities.persons 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	import net.mnml.entities.ui.ShamanText;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Shaman extends Person 
	{
		[Embed(source = '/../assets/sprites/spr_shaman.png')] private const PERSON_NPC:Class;
		
		public var popupText	: ShamanText;
		private var startedText : Boolean;
		
		private var origX: int;
		private var origY: int;
		
		public function Shaman(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			origX = x;
			origY = y;
			
			startedText = false;
			
			popupText = new ShamanText(this, new Array(
												"The sun has marked your arrival...",
												"... and now you have arrived unto us.",
												"All that exists, has existed...",
												"... will now come to an end.",
												"All that begins, concludes.",
												"Once you step onto the sigillum,",
												"Everything will cease, except you.",
												"It is willed, and soon\n\t it will be your will.",
												"....",
												"The time has come...",
												"... for the minimal to ascend."
												));
			FP.world.add(popupText);
			
			graphic = new Image(PERSON_NPC);
			setHitbox(128, 128);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!startedText && collide("Player", x, y) != null)
			{
				popupText.startTextRead();
				startedText = true;
			}
			
			var jumpX:Number = (Math.random() * 2 - 1);
			var jumpY:Number = (Math.random() * 2 - 1);
			
			x = origX + jumpX;
			y = origY + jumpY;
		}
	}
}