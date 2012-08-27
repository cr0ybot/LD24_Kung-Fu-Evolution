package com.cr0ybot.ld24.entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.cr0ybot.ld24.utils.Moves;

/**
 * ...
 * @author Cory Hughart
 */

class PlayerEntity extends FighterEntity
{
	// Might need to turn these into Array<Int> to accomodate multiple keys, customization
	private static inline var PUNCH_KEY	:Int = Key.Z;
	private static inline var KICK_KEY	:Int = Key.X;
	private static inline var JUMP_KEY	:Int = Key.SPACE;
	private static inline var BLOCK_KEY	:Int = Key.C;
	private static inline var LEFT_KEY	:Int = Key.LEFT;
	private static inline var RIGHT_KEY	:Int = Key.RIGHT;
	
	
	public function new(x:Float, y:Float, focus:String, punch:String, kick:String, jump:String, block:String) 
	{
		Input.define(FighterEntity.RIGHT, [RIGHT_KEY]);
		Input.define(FighterEntity.LEFT, [LEFT_KEY]);
		Input.define(Moves.PUNCH, [PUNCH_KEY]);
		Input.define(Moves.KICK, [KICK_KEY]);
		Input.define(Moves.JUMP, [JUMP_KEY]);
		Input.define(Moves.BLOCK, [BLOCK_KEY]);
		
		super(x, y, focus, punch, kick, jump, block);
	}
	
	/*
	public override function added()
	{
		
	}
	*/
	
	public override function moveHandler()
	{
		var curAnim:String = getAnimState();
		
		if (!actionState || curAnim == FighterEntity.WALK)
		{
			if (Input.pressed(Moves.PUNCH))
			{
				setAnimState(Moves.PUNCH);
			}
			else if (Input.pressed(Moves.KICK))
			{
				setAnimState(Moves.KICK);
			}
			else if (Input.pressed(Moves.JUMP))
			{
				setAnimState(Moves.JUMP);
			}
			else if (Input.pressed(Moves.BLOCK))
			{
				setAnimState(Moves.BLOCK);
			}
			// Check movement keys last so moves dont get overridden
			else if (Input.check(FighterEntity.RIGHT))
			{
				if (sprite.flipped) sprite.flipped = false;
				setAnimState(FighterEntity.WALK);
			}
			else if (Input.check(FighterEntity.LEFT))
			{
				if (!sprite.flipped) sprite.flipped = true;
				setAnimState(FighterEntity.WALK);
			}
			else
			{
				setAnimState(FighterEntity.IDLE);
			}
		}
		else
		{
			
		}
		
		/*
		if (Input.check(Moves.PUNCH))
		{
			setAnimState(Moves.PUNCH);
		}
		else if ((curAnim != IDLE || curAnim == WALK) && Input.check(RIGHT))
		{
			if (sprite.flipped) sprite.flipped = false;
			setAnimState(WALK);
		}
		else if ((curAnim != IDLE || curAnim == WALK) && Input.check(LEFT))
		{
			if (!sprite.flipped) sprite.flipped = true;
			setAnimState(WALK);
		}
		else
		{
			setAnimState(IDLE);
		}
		*/
	}
}