//
//  GameState.swift
//  tictacto
//
//  Created by Keithon Stribling on 11/2/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class GameState: NSObject
{
	/** Properties **/
	var players : [Player] = []
	var currentPlayer: Player?
	
	/** Overrides **/
	override init()
	{
		super.init()
	}
	
	/** Custom Methods **/
	func create(player: Player)
	{
		self.players.append(player)
	}
	
	//create function to set current player
		// check each players button for isActive
		// If button is active, turn it off
		// If buttons is not active, turn it on
		// store new active player, based on who we just turned on
	
	func getCurrentPlayer() -> Player?
	{
		for player in players
		{
	
			if let button = player.button as PlayerButton?, button.isActive
			{
				return player
			}
		}
		return nil
	}
}

let currentGame = GameState.init()
