package net.mnml.worlds 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	import net.mnml.worlds.SigillumWorld;
	import net.mnml.entities.ui.ScrollingText;
	import net.mnml.entities.ui.Fade;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class PreGame extends World 
	{
		private var text 	: ScrollingText;
		private var fade	: Fade;
		
		public function PreGame() 
		{
			fade = new Fade("Title");
			text = new ScrollingText(new Array( "press enter to continue",
												"please press enter",
												"make your final ascention",
												"press the enter key",
												"you have been chosen",
												"all that exists, ends",
												"a new beginning is near"
												));
			add(text);
			text.startTextRead();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Key.ENTER))
			{
				FP.musicController.heatless.loop();
				add(fade);
			}
		}
	}
}