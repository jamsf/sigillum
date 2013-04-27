package net.mnml.worlds 
{
	import net.flashpunk.World;
	import net.mnml.entities.persons.Player;
	import net.mnml.entities.structures.Wall;
	import net.mnml.entities.structures.WallToNewWorld;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class MountainTrail extends World 
	{
		public var player	:Player;
		
		public function MountainTrail() 
		{
			super();
			createLevel();
		}
		
		override public function update():void 
		{
			super.update();
			
			camera.x = player.centerX - 400;
			camera.y = player.centerY - 300;
		}
		
		private function createLevel():void
		{
			var gridSize:uint = 64;
			var rowSize:uint = 64 * 5;
			
								
			var level:String = "xxxxxn" +
								"xopoxn" +
								"xxxxxne";
			
			var levelIndex : uint = 0;
			var xCoord : int = -64;
			var yCoord : int = 0;
			
			while (level.charAt(levelIndex) != 'e')
			{
				++levelIndex;
				if (level.charAt(levelIndex) == 'n')
				{
					yCoord += gridSize;
					xCoord -= rowSize;
				}
				else
				{
					if (level.charAt(levelIndex) == 'x')
						add(new Wall(xCoord, yCoord));
					else if (level.charAt(levelIndex) == 'p')
					{
						player = new Player(xCoord, yCoord);
						add(player);
					}
					else if (level.charAt(levelIndex) == 'w')
						add(new WallToNewWorld(xCoord, yCoord, "MountainTrail"));
					xCoord += gridSize;
				}
				
				
			}
		}
	}
}