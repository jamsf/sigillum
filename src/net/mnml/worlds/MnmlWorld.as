package net.mnml.worlds 
{
	import net.flashpunk.World;
	import net.flashpunk.debug.Console;
	
	import net.mnml.entities.Reticle;
	import net.mnml.entities.persons.Player;
	
	/**
	 * ...
	 * @author jams
	 */
	public class MnmlWorld extends World 
	{
		
		public function MnmlWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			add(new Player());
		}
		
		override public function update():void 
		{
			super.update();
			
		}
	}

}