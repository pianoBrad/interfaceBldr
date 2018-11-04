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
	var playerScore : Int?
	var button : PlayerButton?
	
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
