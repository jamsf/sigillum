package net.mnml.entities 
{
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Jams
	 */
	public class MusicController 
	{
		[Embed(source = '/../assets/music/heatless.mp3')] private const HEATLESS:Class;
		[Embed(source = '/../assets/music/sigillum.mp3')] private const SIGILLUM:Class;
		[Embed(source = '/../assets/music/trail.mp3')] private const TRAIL:Class;
		[Embed(source = '/../assets/music/trail1.mp3')] private const TRAIL1:Class;
		
		public  var heatless	: Sfx;
		public  var sigillum	: Sfx;
		public  var trail		: Sfx;
		public  var trail1		: Sfx;
		
		public function MusicController() 
		{
			heatless = new Sfx(HEATLESS);
			sigillum = new Sfx(SIGILLUM);
			trail = new Sfx(TRAIL);
			trail1 = new Sfx(TRAIL1);
		}
	}
}