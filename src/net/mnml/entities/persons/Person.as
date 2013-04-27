package net.mnml.entities.persons
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	
	/**
	 * ...
	 * @author jams
	 */
	public class Person extends Entity 
	{
		/* Movement Variables */
		/** @protected */ protected var _xVel		:Number;
		/** @protected */ protected var _yVel		:Number;
		/** @protected */ protected var _xMaxVel	:Number;
		/** @protected */ protected var _yMaxVel	:Number;
		/** @protected */ protected var _accel		:Number;
		/** @protected */ protected var _decel		:Number;
		
		/* Weapon Variables */
		/** @protected */ protected var _spriteMap	:Spritemap;
		
		public function Person() 
		{
			_xVel = 0;
			_yVel = 0;
			
		}
		
		override public function update():void 
		{
			super.update();
			x += _xVel;
			y += _yVel;
			updateAnimation();
		}
		
		protected function updateAnimation():void
		{
			
		}
	}
}