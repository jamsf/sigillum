package net.mnml.entities.structures 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.mnml.entities.persons.Player;
	import net.mnml.worlds.Title;
	
	import net.mnml.entities.structures.Structure;
	import net.mnml.worlds.Ending;
	
	/**
	 * ...
	 * @author jams
	 */
	public class Sigillum extends Structure 
	{
		
		[Embed(source = '/../assets/sprites/sigillum.png')] private const SIGILLUM:Class;
		
		private var endingTimer	:uint;
		private var ending		:Boolean;
		private var player		:Player;
		
		private var orgCamX		:int;
		private var orgCamY		:int;
		private var setCam		:Boolean;
		
		public function Sigillum(x:int, y:int, invisible:Boolean=false, p:Player=null) 
		{
			super();
			player = p;
			this.x = x - 30;
			this.y = y - 15;
			graphic = new Image(SIGILLUM);
			setHitbox(64, 64);
			this.collidable = true;
			this.type = "Sigillum";
			endingTimer = 180;
			setCam = false;
			
			if (invisible)
			{
				(graphic as Image).alpha = 0;
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (collide("Player", x, y) != null)
			{
				ending = true;
				player.unlockCamera = true;
				
				if (!setCam)
				{
					orgCamX = FP.camera.x;
					orgCamY = FP.camera.y;
					setCam = true;
					FP.musicController.endsfx.play();
				}
			}
				
			if (ending)
			{
				--endingTimer;
				var randX:int = (Math.random() ) * ((180-endingTimer)^2);
				var randY:int = (Math.random() ) * ((180-endingTimer)^2);
				
				var xSgn : int = Math.random() > 0.5 ? 1 : -1;
				var ySgn : int = Math.random() > 0.5 ? 1 : -1;
				
				FP.camera.x = orgCamX + randX * xSgn;
				FP.camera.y = orgCamY + randY * ySgn;
			}
			
			if (endingTimer == 0)
			{
				FP.world = new Ending();
			}
		}
		
		public function makeVisible():void
		{
			(graphic as Image).alpha = 1;
		}
	}
}