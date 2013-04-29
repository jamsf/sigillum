package net.mnml.entities.structures 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	import net.mnml.entities.structures.Structure;
	
	/**
	 * ...
	 * @author jams
	 */
	public class Prisoms extends Structure 
	{
		
		[Embed(source = '/../assets/sprites/spr_prisoms.png')] private const PRISOMS:Class;
		
		private var spriteMap	: Spritemap;
		
		public function Prisoms(x:int, y:int, invisible:Boolean=false, wall:Boolean = false) 
		{
			super();
			this.x = x;
			this.y = y;
			setHitbox(64, 64);
			this.collidable = true;
			
			spriteMap = new Spritemap(PRISOMS, 64, 64);
			
			spriteMap.add("0", [0]);
			spriteMap.add("1", [1]);
			spriteMap.add("2", [2]);
			spriteMap.add("3", [3]);
			spriteMap.add("4", [4]);
			
			graphic = spriteMap;
			
			if (!wall)
			{
				var randFrame : uint = uint(Math.random() * 4) + 1;
				spriteMap.play(randFrame.toString(), true);
			}
			else
			{
				spriteMap.play("0", true);
			}
			
			type = "Wall";
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}