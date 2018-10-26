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
	
	override func viewDidLoad()
	{
    }
    
    /** Custom methods **/
    func startGame()
    {
        playerView.reset()
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
