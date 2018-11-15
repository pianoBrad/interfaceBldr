//
//  TicTacToeVC.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController
{
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var gameBoard: GameBoard!
    @IBOutlet weak var controlPanel: ControlPanel!
	

	
	/** Overrides **/
	
	override func viewDidLoad()
	{
		gameBoard.boardDelegate = self
		controlPanel.panelDelegate = self
		
		
    }
	
	
	
	
    /** Custom methods **/
    func startGame()
    {
        playerView.reset()
		gameBoard.reset()
    }
    
    func endGame()
    {
        playerView.end()
		
    }
	
}

extension TicTacToeVC : ControlPanelDelegate
{
    func restartBtnWasPress(_ sender: ControlPanelBtn)
    {
		self.startGame()
    }
}

extension TicTacToeVC : GameBoardDelegate
{
	func matchFound(for player: Player) {
		
		player.isWinner = true
		
		endGame()
		
		// the line below is what fixed the bug of not changing winners.
		player.isWinner = false
		
		// the line below is what fixed the bug that allowed buttons to be pressed after winner.
		self.gameBoard.disableRemainingBtns()

	}
	
	func noMatchFound()
	{
		playerView.changePlayer()
	}
	
	
}
