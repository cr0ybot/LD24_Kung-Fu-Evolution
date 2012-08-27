package com.cr0ybot.ld24.entities;

import com.cr0ybot.ld24.utils.Style;
import com.cr0ybot.ld24.utils.Moves;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

/**
 * ...
 * @author Cory Hughart
 */

enum AnimState {
	Idle;
	Walk;
	Punch;
	Kick;
	Jump;
	Block;
}

class FighterEntity extends Entity
{
	private static inline var FRAME_WIDTH:Int = 22;
	private static inline var FRAME_HEIGHT:Int = 24;
	private static inline var SCALE:Int = 2;
	
	public static inline var RIGHT	:String = "right";
	public static inline var LEFT	:String = "left";
	public static inline var IDLE	:String = "idle";
	public static inline var WALK	:String = "walk";
	
	public var focusStyle:String;
	public var punchStyle:String;
	public var kickStyle:String;
	public var jumpStyle:String;
	public var blockStyle:String;
	
	private var animPlaying:Bool = false;
	private var actionState:Bool = false;
	
	private var animState:AnimState;
	public function getAnimState():String
	{
		switch(animState)
		{
			case Idle: return IDLE;
			case Walk: return WALK;
			case Punch: return Moves.PUNCH;
			case Kick: return Moves.KICK;
			case Jump: return Moves.JUMP;
			case Block: return Moves.BLOCK;
			default: return IDLE;
		}
	}
	public function setAnimState(state:String):Void
	{
		switch(state)
		{
			case IDLE:
				actionState = false;
				animState = Idle;
			case WALK:
				actionState = false;
				animState = Walk;
			case Moves.PUNCH:
				actionState = true;
				animState = Punch;
			case Moves.KICK:
				actionState = true;
				animState = Kick;
			case Moves.JUMP:
				actionState = true;
				animState = Jump;
			case Moves.BLOCK:
				actionState = true;
				animState = Block;
			default:
				actionState = false; animState = Idle;
		}
	}
	
	/*
	public var punchMove:String;
	public var kickSMove:String;
	public var jumpMove:String;
	public var blockMove:String;
	*/
	
	public var sprite:Spritemap;
	
	public function new(x:Float, y:Float, focus:String, punch:String, kick:String, jump:String, block:String) 
	{
		focusStyle = focus;
		punchStyle = punch;
		kickStyle = kick;
		jumpStyle = jump;
		blockStyle = block;
		
		animState = Idle;
		
		/*
		punchMove = Style.getMoveName(punchStyle, PUNCH);
		kickMove = Style.getMoveName(kickStyle, KICK);
		jumpMove = Style.getMoveName(jumpStyle, JUMP);
		blockMove = Style.getMoveName(blockStyle, BLOCK);
		*/
		
		sprite = new Spritemap(Style.getSpriteSource(focusStyle), FRAME_WIDTH, FRAME_HEIGHT, animEnd);
		sprite.scale = SCALE;
		
		sprite.add(IDLE, [0, 1], 3, true);
		sprite.add(WALK, [1, 2, 3, 4, 5, 6, 7, 8], 18, true);
		sprite.add(Moves.PUNCH, Moves.getFrames(punchStyle, Moves.PUNCH), 18, false);
		sprite.add(Moves.KICK, Moves.getFrames(kickStyle, Moves.KICK), 13, false);
		sprite.add(Moves.JUMP, Moves.getFrames(jumpStyle, Moves.JUMP), 15, false);
		sprite.add(Moves.BLOCK, Moves.getFrames(blockStyle, Moves.BLOCK), 14, false);
		
		graphic = sprite;
		
		super(x, y);
	}
	
	public override function update()
	{
		//sprite.play("idle");
		moveHandler();
		animHandler();
	}
	
	private function moveHandler()
	{
		
	}
	
	private function animHandler()
	{
		sprite.play(getAnimState(), !animPlaying);
		animPlaying = true;
	}
	
	private function animEnd()
	{
		// if finished performing action, set to IDLE so next move can be performed
		if (actionState) setAnimState(IDLE);
		else if (getAnimState() == WALK) setAnimState(IDLE);
		animPlaying = false;
		trace("actionState: " + actionState);
	}
}

/*
70 Fighter style combos:

monkey,monkey,monkey,monkey
monkey,monkey,monkey,turtle
monkey,monkey,monkey,dragon
monkey,monkey,monkey,crane
monkey,monkey,monkey,tiger
monkey,monkey,turtle,turtle
monkey,monkey,turtle,dragon
monkey,monkey,turtle,crane
monkey,monkey,turtle,tiger
monkey,monkey,dragon,dragon
monkey,monkey,dragon,crane
monkey,monkey,dragon,tiger
monkey,monkey,crane,crane
monkey,monkey,crane,tiger
monkey,monkey,tiger,tiger
monkey,turtle,turtle,turtle
monkey,turtle,turtle,dragon
monkey,turtle,turtle,crane
monkey,turtle,turtle,tiger
monkey,turtle,dragon,dragon
monkey,turtle,dragon,crane
monkey,turtle,dragon,tiger
monkey,turtle,crane,crane
monkey,turtle,crane,tiger
monkey,turtle,tiger,tiger
monkey,dragon,dragon,dragon
monkey,dragon,dragon,crane
monkey,dragon,dragon,tiger
monkey,dragon,crane,crane
monkey,dragon,crane,tiger
monkey,dragon,tiger,tiger
monkey,crane,crane,crane
monkey,crane,crane,tiger
monkey,crane,tiger,tiger
monkey,tiger,tiger,tiger
turtle,turtle,turtle,turtle
turtle,turtle,turtle,dragon
turtle,turtle,turtle,crane
turtle,turtle,turtle,tiger
turtle,turtle,dragon,dragon
turtle,turtle,dragon,crane
turtle,turtle,dragon,tiger
turtle,turtle,crane,crane
turtle,turtle,crane,tiger
turtle,turtle,tiger,tiger
turtle,dragon,dragon,dragon
turtle,dragon,dragon,crane
turtle,dragon,dragon,tiger
turtle,dragon,crane,crane
turtle,dragon,crane,tiger
turtle,dragon,tiger,tiger
turtle,crane,crane,crane
turtle,crane,crane,tiger
turtle,crane,tiger,tiger
turtle,tiger,tiger,tiger
dragon,dragon,dragon,dragon
dragon,dragon,dragon,crane
dragon,dragon,dragon,tiger
dragon,dragon,crane,crane
dragon,dragon,crane,tiger
dragon,dragon,tiger,tiger
dragon,crane,crane,crane
dragon,crane,crane,tiger
dragon,crane,tiger,tiger
dragon,tiger,tiger,tiger
crane,crane,crane,crane
crane,crane,crane,tiger
crane,crane,tiger,tiger
crane,tiger,tiger,tiger
tiger,tiger,tiger,tiger 
*/