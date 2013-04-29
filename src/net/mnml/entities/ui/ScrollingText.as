package net.mnml.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class ScrollingText extends Entity
	{
		private var _text			:Text;
		private var _possStrs		:Array;
		
		private var _started		:Boolean;
		private var _chosenStr		:String;
		private var _strIndex		:uint;
		private var _typingWait		:uint;
		private var _strs			:Array;
		private var _visibleTimer	:uint;
		
		
		public function ScrollingText(possStrs:Array=null)
		{
			x = 200;
			y = 100;
			this._possStrs = possStrs;
			_text = new Text("null", 200, 100, { "alpha":0 } );
			graphic = _text;
			
			_strs = possStrs;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_started)
			{
				_text.x = 200;
				_text.y = 100;
				
				_text.x += (Math.random() * 2 - 1);
				_text.y += (Math.random() * 2 - 1);
				
				// Turn up alpha & write string
				if (_strIndex <= _chosenStr.length)
				{
					_text.alpha = Math.min(_text.alpha + 0.01, 1);
					_text.text = _chosenStr.substr(0, _strIndex);
					if (_typingWait == 0)
					{
						++_strIndex;
						_typingWait = 5;
					}
					else
						--_typingWait;
				}
				else
				{
					// Set timer
					if (_visibleTimer == 0)
					{
						if (_text.alpha <= 0)
						{
							startTextRead();
						}
						else
							_text.alpha -= 0.025;
					}
					else
						_visibleTimer -= 1;
				}
			}
		}
		
		public function startTextRead():void
		{
			_started = true;
			_chosenStr = _strs[uint(Math.random() * _strs.length)];
			_strIndex = 1;
			_visibleTimer = 60;
		}
		
	}

}