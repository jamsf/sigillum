package net.mnml.worlds 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.MathPlus;
	import net.mnml.entities.background.MBBackground;
	import net.mnml.entities.background.Planets;
	import net.flashpunk.FP;
	import net.mnml.entities.background.Trees;
	import net.mnml.entities.ui.Fade;
	
	import net.mnml.entities.background.Mountain;
	import net.mnml.entities.background.Path;
	import net.mnml.entities.persons.Player;
	import net.mnml.entities.structures.Wall;
	import net.mnml.entities.structures.WallToNewWorld;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class MountainBase extends SigillumWorld 
	{
		
		private const level : String = "ovvvvvvvn" +
										"vtttttvn" +
										"vttqttvn" +
										"vvvvvvvne";
										
		private var mountain	: MBBackground;
		private var planets		: Planets;
		private var path		: Path;
		private var dist		: int;
		private var songTimer	: int;
		
		
		public function MountainBase() 
		{
			super();
			songTimer = 60 * 3;
			dist = 0;
			
			FP.camera.x = 0;
			FP.camera.y = 0;
			
			mountain = new MBBackground(FP.camera.x + 160, FP.camera.y);
			mountain.setScale(1);
			add(mountain);
			
			
			createLevel(level, 7, "MBBackground");
			
			player.setHalfScale();
			
			FP.musicController.trail.stop();
			FP.musicController.trail1.stop();
			FP.musicController.sigillum.loop();
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
				mountain.scaleIncrease( -0.000025 * player.yVel);
				
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
						add(new Trees(-180 + Math.random() * 150, -0.2, player));
					else
						add(new Trees(220 + Math.random() * 200, 0.3, player));
					dist = 0;
				}
			}
			
			if (!switchingWorlds && mountain.getScale() >= 1.2)
			{
				fade = new Fade("Temple");
				add(fade);
				switchingWorlds = true;
			}
			else if (fade != null)
				bringToFront(fade);
		}
	}

}