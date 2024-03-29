package net.mnml.worlds 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.MathPlus;
	import net.mnml.entities.background.Planets;
	import net.flashpunk.FP;
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
	public class MountainTrail extends SigillumWorld 
	{
		
		private const level : String = "ovvvvvvvn" +
										"vtttttvn" +
										"vttqttvn" +
										"vvvvvvvne";
										
		private var mountain	: Mountain;
		private var planets		: Planets;
		private var path		: Path;
		private var dist		: int;
		private var songTimer	: int;
		
		
		public function MountainTrail() 
		{
			super();
			songTimer = 60 * 3;
			dist = 0;
			createLevel(level, 7, "MountainBase");
			
			add(new Planets());
			
			mountain = new Mountain(160, -64);
			mountain.setScale(0.1);
			add(mountain);
			
			player.setHalfScale();
			FP.musicController.heatless.stop();
			FP.musicController.trail.play();
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
				else if(dist <= -400)
				{
					if(Math.random() < 0.5)
						add(new Path(-120 + Math.random() * 200, -0.2, player));
					else
						add(new Path(180 + Math.random() * 200, 0.3, player));
					dist = 0;
				}
			}
			
			if (!switchingWorlds && mountain.getScale() >= 0.3)
			{
				fade = new Fade("MountainBase");
				add(fade);
				switchingWorlds = true;
			}
			else if (fade != null)
				bringToFront(fade);
		}
	}
}