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
	
	
	
	override func viewDidLoad()
	{
    	playerXButton.buttonDelegate = self
		playerOButton.buttonDelegate = self
		
		playerOButton.playerNameLabel.text = "O"
    }
}


extension TicTacToeVC: PlayerButtonDelegate
{
	func buttonTapped(_ sender: PlayerButton)
	{
		sender.changeButtonState(toState: !sender.isActive)
		sender.isActive = !sender.isActive
		
		switch sender {
		case playerXButton:
			playerOButton.changeButtonState(toState: !sender.isActive)
			playerOButton.isActive = !sender.isActive
		default:
			playerXButton.changeButtonState(toState: !sender.isActive)
			playerXButton.isActive = !sender.isActive
			break
		}
	}
}
