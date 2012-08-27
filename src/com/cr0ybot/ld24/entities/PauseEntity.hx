package com.cr0ybot.ld24.entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;

/**
 * ...
 * @author Cory Hughart
 */

class PauseEntity extends Entity
{

	public function new() 
	{
		super();
	}
	
	public override function added()
	{
		addGraphic(new Text("PAUSED", 50, 50, 300, 30));
	}
	
}