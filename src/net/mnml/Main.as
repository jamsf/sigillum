package net.mnml
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.mnml.entities.background.Mountain;
	import net.mnml.entities.ui.TitleText;
	import net.mnml.worlds.Ending;
	import net.mnml.worlds.InsideTemple;
	import net.mnml.worlds.MountainTrail;
	import net.mnml.worlds.Title;
	import net.mnml.worlds.PreGame;
	import net.mnml.worlds.MountainBase;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	import net.mnml.worlds.OutsideWorld;
	import net.mnml.worlds.OutsideTemple;

	/**
	 * ...
	 * @author jams
	 */
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(800, 600, 60, false);
			
			// Create initial world
			FP.world = new PreGame();
		}
		
		override public function init():void
		{
			trace("THIS IS WORKING PROPERLY");
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.DELETE))
				FP.console.enable();
			Input.mouseCursor = "hide";
		}
	}

}