package com.cr0ybot.ld24.worlds;

import com.cr0ybot.ld24.entities.PlayerEntity;
import com.cr0ybot.ld24.utils.GameState;
import com.cr0ybot.ld24.utils.Style;
import com.haxepunk.World;

/**
 * ...
 * @author Cory Hughart
 */

class GameWorld extends World
{
	
	var player:PlayerEntity;
	
	public function new() 
	{
		super();
	}
	
	public override function begin()
	{
		player = new PlayerEntity(50, 50, Style.DRAGON, Style.MONKEY, Style.MONKEY, Style.MONKEY, Style.DRAGON);
		add(player);
	}
	
	public override function update()
	{
		switch (GameState.state)
		{
			case GameState.INTRO:
				
			// end INTRO
			
			case GameState.CHOOSE:
				
			// end CHOOSE
			
			case GameState.FIGHT:
				
			// end FIGHT
			
			case GameState.RESULT:
				
			// end RESULT
			
			case GameState.TREE:
				
			// end TREE
		}
		
		super.update();
	}
	
}