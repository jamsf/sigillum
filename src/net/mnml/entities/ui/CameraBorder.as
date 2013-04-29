package net.mnml.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class CameraBorder extends Entity
	{
		[Embed(source = '/../assets/sprites/spr_border.png')] private const BORDER:Class;
		
		public function CameraBorder() 
		{
			graphic = new Image(BORDER);
		}
		
		override public function update():void 
		{
			super.update();
			
			x = FP.world.camera.x;
			y = FP.world.camera.y;
		}
	}
}