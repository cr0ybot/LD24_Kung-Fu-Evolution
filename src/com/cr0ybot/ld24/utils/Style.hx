package com.cr0ybot.ld24.utils;

/**
 * ...
 * @author Cory Hughart
 */

 /*
enum StyleEnum
{
	DRAGON;
	CRANE;
	MONKEY;
	TURTLE;
	TIGER;
}
*/

class Style 
{
	public static inline var DRAGON	:String = "dragon";
	public static inline var CRANE	:String = "crane";
	public static inline var MONKEY	:String = "monkey";
	public static inline var TURTLE	:String = "turtle";
	public static inline var TIGER	:String = "tiger";
	
	public static function getSpriteSource(style:String):String
	{
		switch(style)
		{
			case DRAGON:	return "gfx/fighter/fighter_dragon.png";
			case CRANE:		return "gfx/fighter/fighter_crane.png";
			case MONKEY:	return "gfx/fighter/fighter_monkey.png";
			case TURTLE:	return "gfx/fighter/fighter_turtle.png";
			case TIGER:		return "gfx/fighter/fighter_tiger.png";
			default: return null;
		}
	}
	
	/*
	public static function getMoveName(style:String, move:String):String
	{
		return style + "_" + move;
	}
	*/
	
	public static function getStyleNum(style:String):Int
	{
		switch(style)
		{
			case DRAGON: return 0;
			case CRANE: return 1;
			case MONKEY: return 2;
			case TURTLE: return 3;
			case TIGER: return 4;
			default: return 0;
		}
	}
	
}
