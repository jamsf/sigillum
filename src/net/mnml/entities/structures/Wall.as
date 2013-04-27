package net.mnml.entities.structures 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	
	import net.mnml.entities.structures.Structure;
	
	/**
	 * ...
	 * @author jams
	 */
	public class Wall extends Structure 
	{
		
		[Embed(source = '/../assets/sprites/spr_wall.png')] private const STRUCTURE_WALL:Class;
		
		public function Wall(x:int, y:int) 
		{
			super();
			this.x = x;
			this.y = y;
			graphic = new Image(STRUCTURE_WALL);
			setHitbox(64, 64);
			this.collidable = true;
			this.type = "Wall";
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}