package net.mnml.entities.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author jams
	 */
	public class PopupText extends Entity
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
		
		
		public function PopupText(owner:Entity, possStrs:Array=null)
		{
			this._owner = owner;
			this._possStrs = possStrs;
			_text = new Text("null", _owner.x - 64, _owner.y - 64, { "alpha":0 } );
			graphic = _text;
			
			//FP.world.add(this);
			
			_strs = new Array(
				"You don't want to go up there.",
				"You should probably go back home.",
				"There's nothing for you up there.",
				"Don't be a fool, leave while you can.",
				"You'll never make it."
				);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_started)
			{
				
				_text.x += (Math.random() * 4 - 2);
				_text.y += (Math.random() * 4 - 2);
				
				// Turn up alpha & write string
				if (_strIndex < _chosenStr.length)
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
							_started = false;
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
			if (_started == false)
			{
				_started = true;
				_chosenStr = _strs[uint(Math.random() * _strs.length)];
				_strIndex = 1;
				_visibleTimer = 60;
			}
		}
	}
}