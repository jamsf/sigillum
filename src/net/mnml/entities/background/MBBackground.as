package net.mnml.entities.background 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jams
	 */
	public class MBBackground extends Entity
	{
		
		[Embed(source = '/../assets/sprites/spr_mountainbase.png')] private const MOUNTAIN_BASE:Class;
		
		public function MBBackground(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			graphic = new Image(MOUNTAIN_BASE);
			(graphic as Image).centerOO();
		}
		
		public function scaleIncrease(s:Number):void
		{
			(graphic as Image).scale += s;
		}
		
		public function setScale(s:Number):void
		{
			(graphic as Image).scale = s;
		}
		
		
		public function getScale():Number { return (graphic as Image).scale; }
	}
}