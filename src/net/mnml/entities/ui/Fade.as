package net.mnml.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.mnml.worlds.InsideTemple;
	import net.mnml.worlds.MountainBase;
	import net.mnml.worlds.MountainTrail;
	import net.mnml.worlds.OutsideTemple;
	import net.mnml.worlds.OutsideWorld;
	import net.mnml.worlds.Title;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Fade extends Entity 
	{
		[Embed(source = '/../assets/sprites/spr_black.png')] private const BLACK:Class;
		
		private var fading		:Boolean;
		private var fadeTimer	:uint;
		private var nextWorld	:String;
		
		public function Fade(world:String) 
		{
			graphic = new Image(BLACK);
			(graphic as Image).alpha = 0;
			fadeTimer = 0;
			nextWorld = world;
		}
		
		override public function update():void 
		{
			super.update();
			
			x = FP.world.camera.x;
			y = FP.world.camera.y;
			
			++fadeTimer;
			(graphic as Image).alpha = fadeTimer / 120;
			
			if (fadeTimer == 140)
			{
				switch(nextWorld)
				{
					case "MountainTrail":
						FP.world = new MountainTrail();
						break;
					case "OutsideWorld":
						FP.world = new OutsideWorld();
						break;
					case "Title":
						FP.world = new Title();
						break;
					case "Temple":
						FP.world = new OutsideTemple();
						break;
					case "MountainBase":
						FP.world = new MountainBase();
						break;
					case "InsideTemple":
						FP.world = new InsideTemple();
						break;
				}
			}
		}
	}
}