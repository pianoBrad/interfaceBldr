//
//  Player.swift
//  tictacto
//
//  Created by Keithon Stribling on 11/2/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class Player: NSObject
{
	/** Properties **/
	var playerSymbol : String?
	var playerStatus : Bool?
	var playerScore : Int = 0
	var button : PlayerButton?
	var isWinner : Bool = false
	
	/** Overrides **/
	override init()
	{
		super.init()
	}
	
	convenience init(withSymbol: String)
	{
		self.init()
		self.playerSymbol = withSymbol
	}
	
	/** Custom Methods **/
	func set(winner: Bool)
	{
		if winner
		{
			self.isWinner = true
			playerScore = playerScore + 1
			self.button?.updateScore(score: playerScore)
		}
		else
		{
			self.isWinner = false
		}
	}
	
	
}
