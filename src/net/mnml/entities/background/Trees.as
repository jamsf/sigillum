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
	public class Trees extends Entity 
	{
		[Embed(source = '/../assets/sprites/spr_trees.png')] private const PATH:Class;
		
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
		
		public function Trees(x:int, moveX:Number, p:Player) 
		{
			
			
			this.x = x;
			this.y = 25;
			this.moveX = moveX;
			frame = 0;
			spriteMap = new Spritemap(PATH, 64, 128);
			player = p;
			
			spriteMap.add("0", [0]);
			spriteMap.add("1", [1]);
			spriteMap.add("2", [2]);
			spriteMap.add("3", [3]);
			
			var randFrame : uint = uint(Math.random() * 4);
			spriteMap.play(randFrame.toString(), true);
			
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
				var moveY : Number = ( distance * 0.0025) * -MathPlus.sgn(player.yVel);
				x += moveX * -MathPlus.sgn(player.yVel);
			}
			else
			{
				moveY = 0;
			}
			
            y += moveY;
			
			spriteMap.scale = (distance*10) / 1200;
			spriteMap.centerOO();
			
			// Delete if need be
			if (spriteMap.scale > 4 || spriteMap.scale < -1) 
				FP.world.remove(this);
		}
	}

}