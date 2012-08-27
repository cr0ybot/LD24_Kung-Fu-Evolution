package com.cr0ybot.ld24.worlds;

import com.haxepunk.World;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import nme.text.TextFormatAlign;

import com.cr0ybot.ld24.worlds.GameWorld;

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
	
	public override function begin():Void
	{
		var opts:TextOptions = {color: 0xFFFFFF, align: TextFormatAlign.CENTER, size: 8};
		
		addGraphic(new Text("Press any key to START", 0, 20, 150, 20, opts));
	}
	
	public override function update():Void
	{
		if (Input.check(Key.ANY))
		{
			HXP.world = new GameWorld();
		}
		
		super.update();
	}
	
}