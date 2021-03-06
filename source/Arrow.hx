package;

import flixel.FlxG;
import flixel.FlxSprite;

class Arrow extends FlxSprite
{
	[Embed(source="data/arrow.png")] private var ImgArrow:Class;
	
	public function Arrow()
	{
		super();
		loadGraphic(ImgArrow,false,true);
		elasticity = 0.5;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(!alive)
		{
			if(justTouched(FLOOR))
			{
				drag.x = 2000;
				if(velocity.y >  -20)
					exists = false;
				else
					angularVelocity = -angularVelocity;
			}
			else
				drag.x = 0;
			return;
		}
		if(justTouched(WALL))
			kill();
	}
	
	override public function kill():Void
	{
		velocity.y = -50-FlxG.random()*50;
		alive = false;
		angularVelocity = 360 + FlxG.random()*360;
		if(FlxG.random() < 0.5)
			angularVelocity = -angularVelocity;
		acceleration.y = 500;
	}
	
	override public function reset(X:Number,Y:Number):Void
	{
		super.reset(X,Y);
		angularVelocity = 0;
		acceleration.y = 0;
		angle = 0;
		drag.x = 0;
	}
}
