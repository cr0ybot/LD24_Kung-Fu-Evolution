package com.cr0ybot.ld24.utils;

/**
 * ...
 * @author Cory Hughart
 */

class Moves 
{
	public static inline var PUNCH	:String = "punch";
	public static inline var KICK	:String = "kick";
	public static inline var JUMP	:String = "jump";
	public static inline var BLOCK	:String = "block";
	
	public static function getMoveNum(move:String):Int
	{
		switch(move)
		{
			case PUNCH: return 0;
			case KICK: return 1;
			case JUMP: return 2;
			case BLOCK: return 3;
			default: return 0;
		}
	}
	
	public static function getFrames(style:String, move:String):Array<Int>
	{
		
		var row:Int = 1;
		// Add Style
		row += Style.getStyleNum(style) * 4;
		row += getMoveNum(move);
		var start:Int = row * 9;
		
		return [start, start + 1, start + 2, start + 3, start + 4, start + 5, start + 6, start + 7, start + 8];
	}
}