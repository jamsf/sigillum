package net.mnml.entities.persons 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.MathPlus;
	import net.flashpunk.FP;
	
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
		
		public function Player() 
		{
			_xMaxVel = 9;
			_yMaxVel = 6;
			_accel = 0.75;
			_decel = 2;
			
			_reticle = new Reticle();
			FP.world.add(_reticle);
			
			graphic = new Image(PLAYER_SPRITEMAP);
		}
		
		override public function update():void 
		{
			updateMovement();
			super.update();
			
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
		
		/*
		override protected function updateAnimation():void 
		{
			super.updateAnimation();
			
			if (Input.mouseX < x + this.width * 0.5)
			{
				if (_xVel > 0)
					_spriteMap.play("leftRobberBackMove");
				else if (_xVel < 0 || _yVel != 0)
					_spriteMap.play("leftRobberForMove");
				else
					_spriteMap.play("leftRobberStand");
			}
			else
			{
				if (_xVel < 0)
					_spriteMap.play("rightRobberBackMove");
				else if (_xVel > 0 || _yVel != 0)
					_spriteMap.play("rightRobberForMove");
				else
					_spriteMap.play("rightRobberStand");
			}
		}
		*/
	}
}