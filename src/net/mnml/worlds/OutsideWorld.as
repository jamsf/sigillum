package net.mnml.worlds 
{
	import flash.automation.MouseAutomationAction;
	import net.flashpunk.World;
	import net.flashpunk.debug.Console;
	import net.mnml.entities.persons.NPC;
	import net.mnml.entities.structures.Wall;
	import net.flashpunk.FP;
	import net.mnml.entities.structures.WallToNewWorld;
	
	import net.mnml.entities.Reticle;
	import net.mnml.entities.persons.Player;
	
	/**
	 * ...
	 * @author jams
	 */
	public class OutsideWorld extends World 
	{
		

		public var player	: Player;
		
		public function OutsideWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			createLevel();
			
			add(new NPC(256, 256));
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
			var rowSize:uint = 64 * 24;
			
			var level:String = "ooooooooooxwwwwwxoooooooon" +
								"oooooooooxoooooxoooooooon" +
								"oooooooooxoooooxoooooooon" +
								"oooooooooxoooooxoooooooon" +
								"oooooooooxoooooxoooooooon" +
								"xxxxxxxxxxoooooxxxxxxxxxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooocooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xooooooooooooooooooooooxn" +
								"xxxxxxxxxxxoooxxxxxxxxxxn" +
								"ooooooooooxoooxooooooooon" +
								"ooooooooooxopoxooooooooon" +
								"ooooooooooxoooxooooooooon" +
								"ooooooooooxxxxxooooooooone";
								
			var smallLevel:String = "xxxxxn" +
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
					else if (level.charAt(levelIndex) == 'c')
						add(new NPC(xCoord, yCoord));
					xCoord += gridSize;
				}
				
				
			}
		}
	}

}