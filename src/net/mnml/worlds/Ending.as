package net.mnml.worlds 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.mnml.entities.ui.EndText;
	
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.mnml.entities.ui.TitleText;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Ending extends World 
	{
		private var _titleTimer 	:uint;
		private var _showingTitle	:Boolean;
		private var _credits		:EndText;
		
		public function Ending() 
		{
			FP.musicController.sigillum.stop();
			FP.screen.color = 0xFF000000;
			add(new EndText());
		}
	}
}