package com.cr0ybot.ld24;

import com.cr0ybot.ld24.worlds.Start;
import com.cr0ybot.ld24.entities.PauseEntity;
import com.haxepunk.Engine;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

/**
 * ...
 * @author Cory Hughart
 */

class Main extends Engine 
{

	public static inline var kScreenWidth:Int = 640;
	public static inline var kScreenHeight:Int = 480;
	public static inline var kFrameRate:Int = 60;
	public static inline var kClearColor:Int = 0x333333;
	public static inline var kProjectName:String = "LD24";
	
	private static var pauseText:Bool = false;

	function new()
	{
		super(kScreenWidth, kScreenHeight, kFrameRate, false);	
	}
	
	override public function init()
	{
#if debug
	#if flash
		if (flash.system.Capabilities.isDebugger)
	#end
		{
			HXP.console.enable();
		}
#end
		HXP.screen.color = kClearColor;
		HXP.screen.scale = 2;
		HXP.world = new Start();
	}

	public static function main()
	{
		var app = new Main();
	}
	
	var pauseEntity:PauseEntity;
	public override function update()
	{
		// TODO: figure out pause screen
		/*
		if (paused)
		{
			if (Input.check(Key.ANY))
			{
				trace("unpausing");
				paused = false;
			}
		}
		
		if (Input.check(Key.P))
		{
			trace("pausing");
			paused = true;
		}
		
		if (paused && !pauseText)
		{
			pauseEntity = cast(HXP.world.create(PauseEntity), PauseEntity);
			pauseText = true;
		}
		else if (!paused && pauseText)
		{
			if (pauseEntity != null)
			{
				HXP.world.recycle(pauseEntity);
			}
		}
		*/
		super.update();
	}
	
	public override function focusGained():Void
	{
		// When the game gains focus.
		paused = false;
	}
			
	public override function focusLost():Void
	{
		// When the game loses focus.
		paused = true;
	}
}