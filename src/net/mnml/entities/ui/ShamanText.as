package net.mnml.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.mnml.worlds.InsideTemple;
	
	/**
	 * ...
	 * @author Jams
	 */
	public class ShamanText extends Entity
	{
		private var _text			:Text;
		private var _possStrs		:Array;
		
		private var _owner			:Entity;
		private var _started		:Boolean;
		private var _chosenStr		:String;
		private var _strIndex		:uint;
		private var _typingWait		:uint;
		private var _strs			:Array;
		private var _visibleTimer	:uint;
		
		private var _textIndex		:uint;
		
		
		public function ShamanText(owner:Entity, possStrs:Array=null)
		{
			this._owner = owner;
			this._possStrs = possStrs;
			_text = new Text("null", _owner.x - 64, _owner.y - 64, { "alpha":0 } );
			graphic = _text;
			
			_strs = possStrs;
			_textIndex = 0;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_started)
			{
				FP.world.bringToFront(this);
				
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
							_text.x = _owner.x - 64;
							_text.y = _owner.y - 32;
							++_textIndex;
							_started = false;
							startTextRead();
						}
						else
							_text.alpha -= 0.025;
					}
					else
						_visibleTimer -= 1;
				}
			}
			else
			{
				_text.x = _owner.x - 64;
				_text.y = _owner.y - 32;
			}
		}
		
		public function startTextRead():void
		{
			if (_textIndex < _strs.length)
			{
				_started = true;
				_chosenStr = _strs[_textIndex];
				_strIndex = 1;
				_visibleTimer = 60;
			}
			else
			{
				FP.musicController.sigillum.stop();
				FP.musicController.boomsfx.play();
				var world:InsideTemple = FP.world as InsideTemple;
				world.erasePrisoms();
				world.sig.makeVisible();
			}
		}
	}
}