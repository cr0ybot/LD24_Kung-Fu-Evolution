package com.cr0ybot.ld24.worlds;

import com.cr0ybot.ld24.entities.PlayerEntity;
import com.cr0ybot.ld24.utils.GameState;
import com.cr0ybot.ld24.utils.Styles;
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
		player = new PlayerEntity(50, 50);
		add(player);
	}
	
	public override function update()
	{
		switch (GameState.state)
		{
			case Intro:
				
			// end INTRO
			
			case Choose:
				
			// end CHOOSE
			
			case Fight:
				
			// end FIGHT
			
			case Result:
				
			// end RESULT
			
			case Tree:
				
			// end TREE
		}
		
		super.update();
	}
	
}