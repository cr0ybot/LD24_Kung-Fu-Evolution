package com.cr0ybot.ld24.entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
//import com.cr0ybot.ld24.utils.Moves;
import com.cr0ybot.ld24.utils.Styles;

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
	
	public function new(x:Float, y:Float, ?focus:Style, ?punch:Style, ?kick:Style, ?jump:Style, ?block:Style) 
	{
		Input.define("Right", [RIGHT_KEY]);
		Input.define("Left", [LEFT_KEY]);
		Input.define("Punch", [PUNCH_KEY]);
		Input.define("Kick", [KICK_KEY]);
		Input.define("Jump", [JUMP_KEY]);
		Input.define("Block", [BLOCK_KEY]);
		
		super(x, y, focus, punch, kick, jump, block);
	}
	
	/*
	public override function added()
	{
		
	}
	*/
	
	public override function moveHandler()
	{
		var curAnim:FighterEntity.AnimState = getAnimState();
		
		if (!actionState || curAnim == FighterEntity.AnimState.Walk)
		{
			if (Input.pressed("Punch"))
			{
				setAnimState(FighterEntity.AnimState.Punch);
			}
			else if (Input.pressed("Kick"))
			{
				setAnimState(FighterEntity.AnimState.Kick);
			}
			else if (Input.check("Jump"))
			{
				setAnimState(FighterEntity.AnimState.JumpStart);
			}
			else if (Input.released("Jump"))
			{
				setAnimState(FighterEntity.AnimState.JumpEnd);
			}
			else if (Input.check("Block"))
			{
				setAnimState(FighterEntity.AnimState.BlockStart);
			}
			else if (Input.released("Block"))
			{
				setAnimState(FighterEntity.AnimState.BlockEnd);
			}
			// Check movement keys last so moves dont get overridden
			else if (Input.check("Right"))
			{
				if (sprite.flipped) sprite.flipped = false;
				setAnimState(FighterEntity.AnimState.Walk);
			}
			else if (Input.check("Left"))
			{
				if (!sprite.flipped) sprite.flipped = true;
				setAnimState(FighterEntity.AnimState.Walk);
			}
			else
			{
				setAnimState(FighterEntity.AnimState.Idle);
			}
		}
		else
		{
			
		}
	}
}