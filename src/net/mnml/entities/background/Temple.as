package net.mnml.entities.background 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Jams
	 */
	public class Temple extends Entity
	{
		
		[Embed(source = '/../assets/sprites/temple.png')] private const TEMPLE:Class;
		
		public function Temple(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			graphic = new Image(TEMPLE);
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