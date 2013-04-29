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
	public class OutsideWorld extends SigillumWorld 
	{
		private const level:String = "ooooooooooxwwwwwxoooooooon" +
										"oooooooooxoooooxoooooooon" +
										"oooooooooxoooooxoooooooon" +
										"oooooooooxoooooxoooooooon" +
										"oooooooooxoooooxoooooooon" +
										"xxxxxxxxxxoooooxxxxxxxxxn" +
										"xooooooooooooooooooooooxn" +
										"xooocooooooooooooooooooxn" +
										"xooooooooooooooooocooooxn" +
										"xooooooooooooooooooooooxn" +
										"xooooooooooooooooooooooxn" +
										"xooooooooooooooooooooooxn" +
										"xooooocooooooooooooooooxn" +
										"xooooooooooooooooooooooxn" +
										"xooooooooooooooooooooooxn" +
										"xooooooooooooooooooooooxn" +
										"xoooooooooooooooooocoooxn" +
										"xooooooooooooooooooooooxn" +
										"xooooooooooooooooooooooxn" +
										"xxxxxxxxxxxoooxxxxxxxxxxn" +
										"ooooooooooxoooxooooooooon" +
										"ooooooooooxopoxooooooooon" +
										"ooooooooooxoooxooooooooon" +
										"ooooooooooxxxxxooooooooone";
		
		public function OutsideWorld() 
		{
			FP.screen.color = 0xFF202020;
		}
		
		override public function begin():void 
		{
			super.begin();
			
			createLevel(level, 24, "MountainTrail");
		}
	}
}