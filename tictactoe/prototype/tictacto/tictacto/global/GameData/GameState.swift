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
	
	func getWinner() -> Player?
	{
		for player in players
		{
			if player.isWinner == true
			{
				return player
			}
		}
		return nil
	}
	
	func setWinner(toPlayer: Player)
	{
		toPlayer.set(winner: true)
	}
	
	
	func reset()
	{
		for player in players
		{
			player.set(winner: false)
		}
	}
	
}

let currentGame = GameState.init()
