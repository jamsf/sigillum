package net.mnml.entities.background 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Planets extends Entity 
	{
		
		[Embed(source = '/../assets/sprites/spr_planets.png')] private const PLANETS:Class;
		
		public function Planets() 
		{
			graphic = new Image(PLANETS);
		}
		
		override public function update():void 
		{
			super.update();
			
			x = FP.world.camera.x;
			y = FP.world.camera.y;
		}
		
	}

}