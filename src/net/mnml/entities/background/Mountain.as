package net.mnml.entities.background 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jams
	 */
	public class Mountain extends Entity
	{
		[Embed(source = '/../assets/sprites/spr_mountain.png')] private const MOUNTAIN:Class;
		
		public function Mountain(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			graphic = new Image(MOUNTAIN);
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