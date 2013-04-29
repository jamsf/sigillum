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
		
		public function Shaman(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			startedText = false;
			
			popupText = new ShamanText(this, new Array(
												"And now you have arrived unto us...",
												"All that exists, has existed...",
												"... will now come to an end.",
												"All that begins, concludes.",
												"Once you step onto the sigillum,",
												"Everything will cease, except you.",
												"All shall die, except you.",
												"It is willed, and soon it will be your will.",
												"....",
												"The time has come...",
												"... for the minimal to ascend."
												));
			FP.world.add(popupText);
			
			graphic = new Image(PERSON_NPC);
			setHitbox(64, 64);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!startedText && collide("Player", x, y) != null)
			{
				popupText.startTextRead();
				startedText = true;
			}
		}
	}
}