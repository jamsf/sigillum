package net.mnml.worlds 
{
	import adobe.utils.ProductManager;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.mnml.entities.background.Mountain;
	import net.mnml.entities.persons.NPC;
	import net.mnml.entities.persons.Player;
	import net.mnml.entities.persons.Shaman;
	import net.mnml.entities.structures.Prisoms;
	import net.mnml.entities.structures.Sigillum;
	import net.mnml.entities.structures.Wall;
	import net.mnml.entities.structures.WallToNewWorld;
	import net.mnml.entities.Triggers.TrailWalkingTrigger;
	import net.mnml.entities.ui.CameraBorder;
	import net.mnml.entities.ui.Fade;
	/**
	 * ...
	 * @author Jams
	 */
	public class SigillumWorld extends World
	{
		public var player	: Player;
		private var cameraBorder	: CameraBorder;
		
		protected var switchingWorlds	: Boolean;
		protected var fade 				: Fade;
		
		protected var prisomToDelete	: Array;
		public var sig				:Sigillum;
		
		public function SigillumWorld() 
		{
			prisomToDelete = new Array();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			cameraBorder = new CameraBorder();
			add(cameraBorder);
			
			switchingWorlds = false;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!player.unlockCamera)
			{
				camera.x = player.centerX - 400;
				camera.y = player.centerY - 300;
			}
			
			this.bringToFront(cameraBorder);
		}
		
		protected function createLevel(level:String, rowLength:uint, newWorld:String):void
		{
			var gridSize:uint = 64;
			var rowSize:uint = 64 * rowLength;
			
			var levelIndex : uint = 0;
			var xCoord : int = -64;
			var yCoord : int = 0;
			
			var sigXCoord:int = 0;
			var sigYCoord:int = 0;
			
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
					if (level.charAt(levelIndex) == 'v')
						add(new Wall(xCoord, yCoord, true));
					else if (level.charAt(levelIndex) == 'p')
					{
						player = new Player(xCoord, yCoord);
						add(player);
					}
					else if (level.charAt(levelIndex) == 'w')
						add(new WallToNewWorld(xCoord, yCoord, newWorld));
					else if (level.charAt(levelIndex) == 'c')
						add(new NPC(xCoord, yCoord));
					else if (level.charAt(levelIndex) == 't')
						add(new TrailWalkingTrigger(xCoord, yCoord));
					else if (level.charAt(levelIndex) == 'q')
					{
						player = new Player(xCoord, yCoord);
						add(player);
						add(new TrailWalkingTrigger(xCoord, yCoord));
					}
					else if (level.charAt(levelIndex) == 'r')
						add(new Prisoms(xCoord, yCoord, true, true));
					else if (level.charAt(levelIndex) == 'm')
						add(new Prisoms(xCoord, yCoord));
					else if (level.charAt(levelIndex) == 'z')
					{
						var prisom : Prisoms = new Prisoms(xCoord, yCoord);
						prisomToDelete.push(prisom);
						add(prisom);
					}
					else if (level.charAt(levelIndex) == 'h')
						add(new Shaman(xCoord, yCoord));
					else if (level.charAt(levelIndex) == 's')
					{
						sigXCoord = xCoord;
						sigYCoord = yCoord;
					}
						
					xCoord += gridSize;
				}
			}
			
			if (sigXCoord != 0)
			{
				sig = new Sigillum(sigXCoord, sigYCoord, true, player);
				add(sig);
			}
		}
	}

}