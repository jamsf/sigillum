package net.mnml.entities.background 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.utils.MathPlus;
	
	import net.mnml.entities.persons.Player;
	import net.mnml.worlds.MountainTrail;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Path extends Entity 
	{
		[Embed(source = '/../assets/sprites/spr_pathmap.png')] private const PATH:Class;
		
		private var spriteMap	: Spritemap;
		private var frame		: uint;
		private var player		: Player;
		
        private const RADIANS : Number = Math.PI * 2;
        private var CENTER_X : int = 160;
        private const CENTER_Y : int = -64;
        private const SCREEN_X : uint = 800;
        private const SCREEN_Y : uint = 600;
        
        
        //---------------------|PRIVATE VARIABLES|---------------------//
        private var angle : Number;
        private var cos : Number;
        private var sin : Number;
		
		private var distance : Number;
		private var acceleration : Number;
		private var moveX	: Number;
		
		public function Path(x:int, moveX:Number, p:Player) 
		{
			this.x = x;
			this.y = -40;
			this.moveX = moveX;
			frame = 0;
			spriteMap = new Spritemap(PATH, 32, 128);
			player = p;
			
			spriteMap.add("0", [0]);
			spriteMap.add("1", [1]);
			spriteMap.add("2", [2]);
			spriteMap.add("3", [3]);
			spriteMap.add("4", [4]);
			spriteMap.add("5", [5]);
			spriteMap.add("6", [6]);
			spriteMap.add("7", [7]);
			
			var randFrame : uint = uint(Math.random() * 8);
			spriteMap.play(randFrame.toString(), true);
			spriteMap.centerOO();
			
			graphic = spriteMap;
			
            distance = 1;
		}
		
		override public function update():void 
		{
			super.update();
			
			// Calculate Speed using distance from center
			distance = y - CENTER_Y;
			
			if (player.yVel != 0)
			{
				var moveY : Number = ( distance * 0.005) * -MathPlus.sgn(player.yVel);
				x += moveX * -MathPlus.sgn(player.yVel);
			}
			else
			{
				moveY = 0;
			}
			
            y += moveY;
			
			spriteMap.scale = distance / 120;
			spriteMap.centerOO();
			
			// Delete if need be
			if (spriteMap.scale > 4 || spriteMap.scale < -1) 
				FP.world.remove(this);
		}
		
		public function decFrame():void
		{
			++frame;
			if (frame > 4) { spriteMap.play("0"); frame = 0 } else spriteMap.play(frame.toString());
		}
		
		public function incFrame():void
		{
			--frame;
			if (frame < 0) { spriteMap.play("4"); frame = 4; } else spriteMap.play(frame.toString());
		}
	}
}