package com.cr0ybot.ld24.utils;

/**
 * ...
 * @author Cory Hughart
 */

enum State
{
	Intro;
	Choose;
	Fight;
	Result;
	Tree;
}
 
class GameState 
{
	public static var state:State = Intro;
	
	public static function getStateString(?value:State):String
	{
		if (value == null) value = state;
		return Std.string(value);
	}
}