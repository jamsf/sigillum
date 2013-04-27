package net.mnml
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.mnml.worlds.Title;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	
	import net.mnml.worlds.OutsideWorld;

	/**
	 * ...
	 * @author jams
	 */
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(800, 600, 60, false);
			
			// Create a Bank world
			FP.world = new OutsideWorld();
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