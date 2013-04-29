package net.mnml.entities.persons 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.mnml.entities.ui.PriestText;
	
	import net.mnml.entities.ui.ShamanText;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Priest extends Person 
	{
		[Embed(source = '/../assets/sprites/spr_shaman.png')] private const PERSON_NPC:Class;
		
		public var popupText	: PriestText;
		
		public function Priest(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			popupText = new (this, new Array( "Blessed is he, the sick."
												));
			FP.world.add(popupText);
			
			graphic = new Image(PERSON_NPC);
			setHitbox(64, 64);
			
			popupText.startTextRead();
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}