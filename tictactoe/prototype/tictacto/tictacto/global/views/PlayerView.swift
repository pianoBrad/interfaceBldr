//
//  PlayerView.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class PlayerView: GameSectionVIew
{
	/** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var playerXBtn: PlayerButton!
    @IBOutlet weak var playerOBtn: PlayerButton!
    @IBOutlet weak var gameStatusLabel: UILabel!
	
	var btnsArray: [PlayerButton] = []
	var startGameMessage : String = "Start game or select player"
	
	/** Overrides **/
    override func commonInit()
    {
        super.commonInit()
        let bundle = Bundle(for: PlayerView.self)
        bundle.loadNibNamed(
            String(describing: PlayerView.self), owner: self, options: nil)
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		gameStatusLabel.text = startGameMessage
		
		btnsArray = [playerXBtn, playerOBtn]
		
		for btn in btnsArray
		{
			let newPlayer : Player = Player.init(withSymbol: btn.playerLabel)
			
			newPlayer.button = btn
			currentGame.create(player: newPlayer)
		}
    }

    override func reset()
    {
        super.reset()
		gameStatusLabel.text = startGameMessage
		playerXBtn.changeButtonState(setActive: true)
		playerOBtn.changeButtonState(setActive: false)
    }
    
    override func end()
    {
        super.end()
		if let winner = currentGame.getWinner(),
			let symbol = winner.playerSymbol
		{
			gameStatusLabel.text = "Player \(symbol) is Winner!"
		}
		else
		{
			catWins()
		}
	}
	
	/** Custom Methods **/
	func changePlayer()
	{
		for btn in btnsArray
		{
			btn.changeButtonState()
		}
		
		if  let currentPlayer = currentGame.getCurrentPlayer(),
			let symbol = currentPlayer.playerSymbol
		{
			gameStatusLabel.text = "Player \(symbol) Turn"
		}
	}
	
	func catWins()
	{
		self.gameStatusLabel.text = "Cat Wins!"
	}
	
	
}
