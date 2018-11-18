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
	/** Properties **/
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
		currentGame.reset()
		playerView.reset()
		gameBoard.reset()
    }
    
    func endGame()
    {
        playerView.end()
		gameBoard.end()
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
	
	func boardEmpty() {
		PlayerButton.resetScore(<#T##PlayerButton#>)
	}
	
	func catWins()
	{
		endGame()
	}
	
	func matchFound(for player: Player)
	{
		currentGame.setWinner(toPlayer: player)
		endGame()
	}
	
	func noMatchFound()
	{
		playerView.changePlayer()
	}
}
