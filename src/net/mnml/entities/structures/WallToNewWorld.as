package net.mnml.entities.structures 
{
	/**
	 * ...
	 * @author Jams
	 */
	public class WallToNewWorld extends Wall 
	{	
		public var worldStr	:String;
		
		
		public function WallToNewWorld(x:int, y:int, world:String) 
		{
			super(x, y);
			this.worldStr = world;
			type = "WallToNewWorld";
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}