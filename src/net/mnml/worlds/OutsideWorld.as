package net.mnml.worlds 
{
	import net.flashpunk.World;
	import net.flashpunk.debug.Console;
	import net.mnml.entities.structures.Wall;
	
	import net.mnml.entities.Reticle;
	import net.mnml.entities.persons.Player;
	
	/**
	 * ...
	 * @author jams
	 */
	public class OutsideWorld extends World 
	{
		
		public function OutsideWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			add(new Player());
			add(new Wall(128, 128));
		}
		
		override public function update():void 
		{
			super.update();
			
		}
	}

}