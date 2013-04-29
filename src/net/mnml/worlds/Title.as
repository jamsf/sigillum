package net.mnml.worlds 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.mnml.entities.ui.TitleText;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class Title extends World 
	{
		private var _titleTimer 	:uint;
		private var _showingTitle	:Boolean;
		private var _title			:TitleText;
		
		public function Title() 
		{
			_titleTimer = 60 * 3;
			_showingTitle = false;
			
			_title = new TitleText(500, 500);
			_title.setAlpha(0);
			add(_title);
			
			//FP.musicController.heatless.loop();
			FP.screen.color = 0xFF000000;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_titleTimer > 0)
			{
				--_titleTimer;
			}
			else
			{
				if (!_showingTitle)
				{
					_title.setAlpha(1);
					_showingTitle = true;
					_titleTimer = 60 * 3;
				}
				else
				{
					FP.world = new OutsideWorld();
				}
			}
			
			if (_showingTitle)
			{	
				_title.graphic.x += (Math.random() * 3 - 1.5);
				_title.graphic.y += (Math.random() * 3 - 1.5);
			}
		}
	}
}