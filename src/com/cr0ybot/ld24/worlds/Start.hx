package com.cr0ybot.ld24.worlds;

import com.haxepunk.World;
import com.haxepunk.graphics.Text;

/**
 * ...
 * @author Cory Hughart
 */

class Start extends World 
{

	public function new() 
	{
		super();
	}
	
	public override function begin()
	{
		addGraphic(new Text("Press any key to START", 50, 50, 300, 30));
	}
	
}