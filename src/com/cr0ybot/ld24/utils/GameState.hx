package com.cr0ybot.ld24.utils;

/**
 * ...
 * @author Cory Hughart
 */

class GameState 
{
	public static inline var INTRO	:String = "intro";
	public static inline var CHOOSE	:String = "choose";
	public static inline var FIGHT	:String = "fight";
	public static inline var RESULT	:String = "result";
	public static inline var TREE	:String = "tree";
	
	public static var state:String = INTRO;
	/*
	private static var _state (getState, setState) :String = INTRO;
	public static function getState():String { return state; }
	public static function setState(value:String):String
	{
		_state = value;
		return _state;
	}
	*/
}