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
	var playerSymbol : String?	// the symbol for each player, passed in through a string.
	var playerStatus : Bool?	// representing a on and off state... my turn or not, true or false.
	var playerScore : Int?		// the players score, passed in via int.
	var button : PlayerButton?	// the button in the PlayerView object.
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
	

}
