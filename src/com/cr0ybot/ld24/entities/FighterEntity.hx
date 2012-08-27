package com.cr0ybot.ld24.entities;

import com.cr0ybot.ld24.utils.Styles;
//import com.cr0ybot.ld24.utils.Moves;
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
	JumpStart;
	JumpEnd;
	BlockStart;
	BlockEnd;
}

class FighterEntity extends Entity
{
	private static inline var FRAME_WIDTH:Int = 22;
	private static inline var FRAME_HEIGHT:Int = 24;
	private static inline var SCALE:Int = 2;
	
	public static inline var RIGHT	:String = "Right";
	public static inline var LEFT	:String = "Left";
	public static inline var IDLE	:String = "Idle";
	public static inline var WALK	:String = "Walk";
	
	public var focusStyle:Style;
	public var punchStyle:Style;
	public var kickStyle:Style;
	public var jumpStyle:Style;
	public var blockStyle:Style;
	
	private var animPlaying:Bool = false;
	private var actionState:Bool = false;
	
	private var animState:AnimState;
	public function getAnimState():AnimState
	{
		/*
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
		*/
		
		return animState;
	}
	public function setAnimState(?state:AnimState):Void
	{
		if (state == null) state = AnimState.Idle;
		
		switch(state)
		{
			case Idle:
				actionState = false;
				animState = Idle;
			case Walk:
				actionState = false;
				animState = Walk;
			case Punch:
				actionState = true;
				animState = Punch;
			case Kick:
				actionState = true;
				animState = Kick;
			case JumpStart:
				actionState = false;
				animState = JumpStart;
			case JumpEnd:
				actionState = true;
				animState = JumpEnd;
			case BlockStart:
				actionState = false;
				animState = BlockStart;
			case BlockEnd:
				actionState = true;
				animState = BlockEnd;
			default:
				actionState = false; animState = Idle;
		}
	}
	public function getAnimStateString(?state:AnimState):String
	{
		if (state == null) state = animState;
		
		return Std.string(state);
	}
	
	/*
	public var punchMove:String;
	public var kickSMove:String;
	public var jumpMove:String;
	public var blockMove:String;
	*/
	
	public var sprite:Spritemap;
	
	public function new(x:Float, y:Float, ?focus:Style, ?punch:Style, ?kick:Style, ?jump:Style, ?block:Style) 
	{
		if (focus == null) focus = Styles.getRandomStyle();
		if (punch == null) punch = Styles.getRandomStyle();
		if (kick == null) kick = Styles.getRandomStyle();
		if (jump == null) jump = Styles.getRandomStyle();
		if (block == null) block = Styles.getRandomStyle();
		
		focusStyle = focus;
		punchStyle = punch;
		kickStyle = kick;
		jumpStyle = jump;
		blockStyle = block;
		
		animState = Idle;
		
		sprite = new Spritemap(Styles.getSpriteSource(focusStyle), FRAME_WIDTH, FRAME_HEIGHT, animEnd);
		sprite.scale = SCALE;
		
		sprite.add(getAnimStateString(Idle), [0, 1], 3, true);
		sprite.add(getAnimStateString(Walk), [1, 2, 3, 4, 5, 6, 7, 8], 18, true);
		sprite.add(getAnimStateString(Punch), Moves.getFrames(punchStyle, Move.Punch), 18, false);
		sprite.add(getAnimStateString(Kick), Moves.getFrames(kickStyle, Move.Kick), 13, false);       
		sprite.add(getAnimStateString(JumpStart), Moves.getFrames(jumpStyle, Move.Jump(true)), 15, false);
		sprite.add(getAnimStateString(JumpEnd), Moves.getFrames(jumpStyle, Move.Jump(false)), 15, false);
		sprite.add(getAnimStateString(BlockStart), Moves.getFrames(blockStyle, Move.Block(true)), 20, false);
		sprite.add(getAnimStateString(BlockEnd), Moves.getFrames(blockStyle, Move.Block(false)), 20, false);
		
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
		sprite.play(getAnimStateString(), !animPlaying);
		animPlaying = true;
	}
	
	private function animEnd()
	{
		// if finished performing action, set to IDLE so next move can be performed
		if (actionState)
		{
			animPlaying = false;
			setAnimState(Idle);
		}
		else if (animState == Walk) setAnimState(Idle);
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