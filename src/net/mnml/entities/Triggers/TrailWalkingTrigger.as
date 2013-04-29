package net.mnml.entities.Triggers 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.mnml.entities.structures.Wall;
	/**
	 * ...
	 * @author Jams
	 */
	public class TrailWalkingTrigger extends Entity
	{
		
		public function TrailWalkingTrigger(x:int, y:int) 
		{
			super(x, y);
			
			setHitbox(64, 64);
			collidable = true;
			type = "TrailWalkingTrigger";
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}