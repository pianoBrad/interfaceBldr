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
        // Change gamestatus text to gameover text
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
	
	
	
}
































extension PlayerView: PlayerButtonDelegate
{
	func buttonTapped(_ sender: PlayerButton) {
		//
	}
	
	
//    func buttonTapped(_ sender: PlayerButton)
//    {
//
//        sender.changeButtonState()
//
//        switch sender
//		{
//        	case playerXBtn:
//            	playerOBtn.changeButtonState(setActive: !sender.isActive)
//        	default:
//            	playerXBtn.changeButtonState(setActive: !sender.isActive)
//            	break
//        }
//
//        updateCurPlayerStatus()
//    }
//
//    func updateCurPlayerStatus()
//    {
//
//        switch playerXBtn.isActive
//        {
//
//			case true:
//				gameStatusLabel.text = "Player X Turn"
//				break
//			default:
//				gameStatusLabel.text = "Player O Turn"
//				break
//        }
//    }
}
