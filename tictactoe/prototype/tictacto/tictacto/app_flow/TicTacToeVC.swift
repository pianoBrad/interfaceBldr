//
//  TicTacToeVC.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {
    
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var gameBoard: GameBoard!
    @IBOutlet weak var controlPanel: ControlPanel!
	
	@IBOutlet weak var playerXButton: PlayerButton!
	@IBOutlet weak var playerOButton: PlayerButton!
	@IBOutlet weak var gameStatusLabel: UILabel!
	
	override func viewDidLoad()
	{
    	playerXButton.buttonDelegate = self
		playerOButton.buttonDelegate = self
		
		// playerOButton.playerNameLabel.text = "O"
        
        playerXButton.changeButtonState(setActive: true)
        playerOButton.changeButtonState(setActive: false)
    }
}


extension TicTacToeVC: PlayerButtonDelegate
{
	func buttonTapped(_ sender: PlayerButton)
	{
		sender.changeButtonState()
		
		switch sender {
		case playerXButton:
			playerOButton.changeButtonState(setActive: !sender.isActive)
		default:
			playerXButton.changeButtonState(setActive: !sender.isActive)
			break
		}
        
        updateCurPlayerStatus()
	}
    
    // To-do: Finish the function & decide where it should be called
	func updateCurPlayerStatus()
    {
        switch playerXButton.isActive
        {
        case true:
			gameStatusLabel.text = "Player X Turn"
            break
        default:
			gameStatusLabel.text = "Player O Turn"
            break
        }
    }
}
