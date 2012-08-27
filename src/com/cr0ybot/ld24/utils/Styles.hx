package com.cr0ybot.ld24.utils;

/**
 * ...
 * @author Cory Hughart
 */

enum Style
{
	Dragon;
	Crane;
	Monkey;
	//Turtle;
	//Tiger;
}

class Styles 
{
	public static function getSpriteSource(?style:Style):String
	{
		if (style == null) style = Style.Dragon;
		
		switch(style)
		{
			case Dragon:	return "gfx/fighter/fighter_dragon.png";
			case Crane:		return "gfx/fighter/fighter_crane.png";
			case Monkey:	return "gfx/fighter/fighter_monkey.png";
			//case Turtle:	return "gfx/fighter/fighter_turtle.png";
			//case Tiger:	return "gfx/fighter/fighter_tiger.png";
			default: return "gfx/fighter/fighter_dragon.png";
		}
	}
	
	public static function getStyleNum(style:Style):Int
	{
		if (style == null) style = Style.Dragon;
		switch(style)
		{
			case Dragon: return 0;
			case Crane: return 1;
			case Monkey: return 2;
			//case Turtle: return 3;
			//case Tiger: return 4;
			default: return 0;
		}
	}
	
	public static function getNumStyle(num:Int):Style
	{
		switch(num)
		{
			case 0: return Style.Dragon;
			case 1: return Style.Crane;
			case 2: return Style.Monkey;
			//case 3: return Style.Turtle;
			//case 4: return Style.Tiger;
			default: return Style.Dragon;
		}
	}
	
	public static function getRandomStyle():Style
	{
		var rand:Int = Std.random(3);
		return getNumStyle(rand);
	}
}

enum Move
{
	Punch;
	Kick;
	Jump(start:Bool);
	Block(start:Bool);
}
 
class Moves 
{
	private static var dragonFrames:MoveFrames = new MoveFrames	
	(
		[0, 1, 2, 3, 3, 4, 5, 6, 6, 7],
		[0, 1, 2, 3, 4, 5, 6, 7, 7, 8]
	);
	private static var craneFrames:MoveFrames = new MoveFrames	
	(
		[0, 1, 1, 2, 3, 4, 5, 6, 7],
		[0, 1, 1, 2, 3, 4, 5, 6, 6, 7, 7, 7, 8]
	);
	private static var monkeyFrames:MoveFrames = new MoveFrames	
	(
		[0, 1, 1, 2, 3, 4, 5, 5, 6, 7],
		[0, 1, 2, 3, 3, 4, 5, 6, 6, 7, 8]
	);
	
	public static function getFrames(?style:Style, ?move:Move):Array<Int>
	{
		if (style == null) style = Style.Dragon;
		if (move == null) move = Move.Punch;
		
		var row:Int = 1;
		// Add Style
		row += Styles.getStyleNum(style) * 4;
		row += getMoveRow(move);
		var position:Int = row * 9;
		
		var framesObj:MoveFrames = getFramesObject(style);
		var styleFramesArray:Array<Int> = framesObj.getMoveFrames(move);
		
		var framesArray:Array<Int> = Lambda.array(Lambda.map(styleFramesArray, function(obj) { return obj + position; } ));
		
		return framesArray;
	}
	
	private static function getMoveRow(?move:Move):Int
	{
		if (move == null) move = Move.Punch;
		
		switch(move)
		{
			case Punch: return 0;
			case Kick: return 1;
			case Jump(start): return 2;
			case Block(start): return 3;
			default: return 0;
		}
	}
	
	private static function getFramesObject(?style:Style):MoveFrames
	{
		if (style == null) style = Style.Dragon;
		
		switch(style)
		{
			case Dragon: return dragonFrames;
			case Crane: return craneFrames;
			case Monkey: return monkeyFrames;
		}
	}
	
	public static function toString(?move:Move):String
	{
		if (move == null) move = Move.Punch;
		
		switch(move)
		{
			case Jump(start): return start ? "JumpStart" : "JumpEnd";
			case Block(start): return start ? "BlockStart" : "BlockEnd";
			default: return Std.string(move);
		}
	}
	
	public static function fromString(string:String):Move
	{
		if (string == "JumpStart") return Move.Jump(true);
		else if (string == "JumpEnd") return Move.Jump(false);
		else if (string == "BlockStart") return Move.Block(true);
		else if (string == "BlockEnd") return Move.Block(false);
		else return Type.createEnum(Move, string);
	}
}

class MoveFrames
{
	public var punchFrames:Array<Int>;
	public var kickFrames:Array<Int>;
	public var jumpStartFrames:Array<Int>;
	public var jumpEndFrames:Array<Int>;
	public var blockStartFrames:Array<Int>;
	public var blockEndFrames:Array<Int>;
	
	public function new(?punchFrames:Array<Int>, ?kickFrames:Array<Int>, ?jumpStartFrames:Array<Int>, ?jumpEndFrames:Array<Int>, ?blockStartFrames:Array<Int>, ?blockEndFrames:Array<Int>)
	{
		this.punchFrames =		(punchFrames != null)		? punchFrames		: [0, 1, 2, 3, 4, 5, 6, 7, 8];
		this.kickFrames =		(kickFrames != null)		? kickFrames		: [0, 1, 2, 3, 4, 5, 6, 7, 8];
		this.jumpStartFrames =	(jumpStartFrames != null)	? jumpStartFrames	: [0, 1, 1, 1, 2];
		this.jumpEndFrames =	(jumpEndFrames != null)		? jumpEndFrames		: [3, 4, 5, 6, 6, 7, 7, 7, 8];
		this.blockStartFrames =	(blockStartFrames != null)	? blockStartFrames	: [0, 1, 2, 3];
		this.blockEndFrames =	(blockEndFrames != null)	? blockEndFrames	: [4];
	}
	
	public function getMoveFrames(?move:Move):Array<Int>
	{
		if (move == null) move = Move.Punch;
		
		switch(move)
		{
			case Punch: return punchFrames;
			case Kick: return kickFrames;
			case Jump(start): return start ? jumpStartFrames : jumpEndFrames;
			case Block(start): return start ? blockStartFrames : blockEndFrames;
		}
	}
}
