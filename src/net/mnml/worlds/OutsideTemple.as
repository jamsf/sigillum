package net.mnml.worlds 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.MathPlus;
	import net.mnml.entities.background.MBBackground;
	import net.mnml.entities.background.Planets;
	import net.flashpunk.FP;
	import net.mnml.entities.background.Poles;
	import net.mnml.entities.background.Temple;
	import net.mnml.entities.background.Trees;
	import net.mnml.entities.ui.Fade;
	
	import net.mnml.entities.background.Mountain;
	import net.mnml.entities.background.Path;
	import net.mnml.entities.persons.Player;
	import net.mnml.entities.structures.Wall;
	import net.mnml.entities.structures.WallToNewWorld;
	import net.mnml.entities.background.Temple;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class OutsideTemple extends SigillumWorld 
	{
		
		private const level : String = "ovvvvvvvn" +
										"vtttttvn" +
										"vttqttvn" +
										"vvvvvvvne";
										
		private var temple		: Temple;
		private var planets		: Planets;
		private var path		: Path;
		private var dist		: int;
		private var songTimer	: int;
		
		
		public function OutsideTemple() 
		{
			super();
			songTimer = 60 * 3;
			dist = 0;
			
			FP.camera.x = 0;
			FP.camera.y = 0;
			
			temple = new Temple(FP.camera.x + 160, FP.camera.y + 40);
			temple.setScale(1);
			temple.centerOrigin();
			add(temple);
			
			
			createLevel(level, 7, "Temple");
			
			player.setHalfScale();
			//FP.musicController.heatless.stop();
			//FP.musicController.trail.play();
		}
		
		override public function update():void 
		{
			super.update();
			
			camera.y -= 200;
			
			if (songTimer == 0) 
			{
				FP.musicController.trail1.loop();
				songTimer = -1;
			}
			else if (songTimer > -2)
				--songTimer;
			
			if (player.collide("TrailWalkingTrigger", player.x, player.y) != null)
			{
				temple.scaleIncrease( -0.000035 * player.yVel);
				
				dist += player.yVel;
				
				if (dist >= 800)
				{
					//add(new Path(160, -64, 245, player));
					//add(new Path(160, -64, 200, player));
					dist = 0;
				}
				else if(dist <= -800)
				{
					if(Math.random() < 0.5)
						add(new Poles(-180 + Math.random() * 150, -0.2, player));
					else
						add(new Poles(220 + Math.random() * 200, 0.3, player));
					dist = 0;
				}
			}
			
			if (!switchingWorlds && temple.getScale() >= 1.3)
			{
				fade = new Fade("InsideTemple");
				add(fade);
				switchingWorlds = true;
			}
			else if (fade != null)
				bringToFront(fade);
		}
	}

}