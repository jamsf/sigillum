package net.mnml.worlds 
{
	import flash.automation.MouseAutomationAction;
	import net.flashpunk.World;
	import net.flashpunk.debug.Console;
	import net.mnml.entities.persons.NPC;
	import net.mnml.entities.structures.Wall;
	import net.flashpunk.FP;
	import net.mnml.entities.structures.WallToNewWorld;
	
	import net.mnml.entities.Reticle;
	import net.mnml.entities.persons.Player;
	
	/**
	 * ...
	 * @author jams
	 */
	public class InsideTemple extends SigillumWorld 
	{
		
		
		private const level:String =   
											"oooooooorrrrrooooooon" +
											"ooooooroooooroooooon" +
											"ooooorooooooorooooon" +
											"ooooroooohooooroooon" +
											"ooorooooooooooorooon" +
											"ooroooooooooooooroon" +
											"orooomooooooomoooron" +
											"roooooooozoooooooorn" +
											"romooooozozooooomorn" +
											"roooooozosozoooooorn" +
											"romooooozozooooomorn" +
											"roooooooozoooooooorn" +
											"roooomooooooomoooorn" +
											"rooooooooooooooooorn" +
											"roooomooooooomoooorn" +
											"rooooooooooooooooorn" +
											"roooomooooooomoooorn" +
											"rooooooooooooooooorn" +
											"orooomooooooomoooron" +
											"ooroooooooooooooroon" +
											"ooorooooooooooorooon" +
											"ooooroooooooooroooon" +
											"ooooorooooooorooooon" +
											"ooooooroooooroooooon" +
											"ooooooroooooroooooon" +
											"ooooooroopooroooooon" +
											"ooooooroooooroooooon" +
											"oooooorrrrrrroooooone";
		
		public function InsideTemple() 
		{
			FP.screen.color = 0xFF202020;
		}
		
		override public function begin():void 
		{
			super.begin();
			
			createLevel(level, 19, "MountainTrail");
		}
		
		override public function update():void 
		{
			super.update();
			
			sendToBack(sig);
		}
		
		public function erasePrisoms():void
		{
			for (var i:int = 0; i < prisomToDelete.length; ++i)
				remove(prisomToDelete[i]);
		}
	}

}