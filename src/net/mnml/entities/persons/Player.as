package net.mnml.entities.persons 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.MathPlus;
	import net.flashpunk.FP;
	import net.mnml.entities.structures.WallToNewWorld;
	import net.mnml.entities.ui.Fade;
	
	import net.mnml.entities.Reticle;
	
	/**
	 * ...
	 * @author jams
	 */
	public class Player extends Person 
	{
		[Embed(source = '/../assets/sprites/spr_player.png')] private const PLAYER_SPRITEMAP:Class;
		
		/* Variables */
		/** @private */ private var _reticle	:Reticle;
		
		private var _goingToNextWorld			:Boolean;
		
		public function Player(x:uint, y:uint) 
		{
			this.x = x;
			this.y = y;
			_xMaxVel = 6;
			_yMaxVel = 4;
			_accel = 0.75;
			_decel = 2;
			
			_reticle = new Reticle();
			FP.world.add(_reticle);
			
			_spriteMap = new Spritemap(PLAYER_SPRITEMAP, 64, 112);
			
			_spriteMap.add("normal", [0]);
			_spriteMap.add("down", [1]);
			_spriteMap.add("up", [2]);
			_spriteMap.add("left", [3]);
			_spriteMap.add("right", [4]);
			
			graphic = _spriteMap;
			_spriteMap.play("normal", true);
			
			graphic = _spriteMap;
			setHitbox(64, 112);
			type = "Player";
			
			_goingToNextWorld = false;
		}
		
		override public function update():void 
		{
			updateMovement();
			super.update();
			
			if (collide("WallToNewWorld", x, y) != null && !_goingToNextWorld)
				gotoNextWorld(collide("WallToNewWorld", x, y));
		}
		
		private function updateMovement():void
		{
			// Y axis movement
			if (Input.check(Key.S))
			{
				if (_yVel < 0)
					_yVel += _decel;
				else
				{
					if (_yVel < _yMaxVel)
						_yVel += _accel;
					else
						_yVel = _yMaxVel;
				}
			}
			else if (Input.check(Key.W))
			{
				if (_yVel > 0)
					_yVel -= _decel;
				else
				{
					if (_yVel > -_yMaxVel)
						_yVel -= _accel;
					else
						_yVel = -_yMaxVel;
				}
			}
			else
			{
				// FRICTION
				_yVel = _yVel - Math.min(Math.abs(_yVel), _accel) * MathPlus.sgn(_yVel);
			}
			
			// X axis movement
			if (Input.check(Key.D))
			{
				if (_xVel < 0)
					_xVel += _decel;
				else
				{
					if (_xVel < _xMaxVel)
						_xVel += _accel;
					else
						_xVel = _xMaxVel;
				}
			}
			else if (Input.check(Key.A))
			{
				if (_xVel > 0)
					_xVel -= _decel;
				else
				{
					if (_xVel > -_xMaxVel)
						_xVel -= _accel;
					else
						_xVel = -_xMaxVel;
				}
			}
			else
			{
				// FRICTION
				_xVel = _xVel - Math.min(Math.abs(_xVel), _accel) * MathPlus.sgn(_xVel);
			}
		}
		
		override protected function updateAnimation():void 
		{
			super.updateAnimation();
			var jumpX:Number = (Math.random() * 2 - 1);
			var jumpY:Number = (Math.random() * 2 - 1);
			
			_spriteMap.x += jumpX;
			_spriteMap.y += jumpY;
			
			
			if (_yVel > 0)
				_spriteMap.play("down");
			else if (_yVel < 0)
				_spriteMap.play("up");
			else if (_xVel > 0)
				_spriteMap.play("right");
			else if (_xVel < 0)
				_spriteMap.play("left");
			else
				_spriteMap.play("normal");
		}
		
		private function gotoNextWorld(e:Entity):void
		{
			_goingToNextWorld = true;
			var worldStr : String = (e as WallToNewWorld).worldStr;
			FP.world.add(new Fade(worldStr));
		}
	}
}