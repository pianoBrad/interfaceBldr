//
//  TicTacToeVC.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {

    /* Properties */
    var playerView : PlayerView!
    var gameBoard : GameBoard!
    var controlPanel : ControlPanel!
    var undoBtn : ControlPanelBtn!
    var resetBtn : ControlPanelBtn!
    var redoBtn : ControlPanelBtn!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        self.view = view
        self.displayPlayerView()
        self.displayGameBoard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayPlayerView()
        displayGameBoard()
        displayControlPanel()
        displayUndoBtn()
        displayResetBtn()
        displayRedoBtn()
    }
    
    /** Custom Methods **/
    func displayPlayerView() {
        
        let playerViewFrame = CGRect.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height/3)
        
        
        
        self.playerView = PlayerView.init(frame: playerViewFrame)
        self.view.addSubview(playerView)
        
    }
    
    func displayGameBoard() {
        
        let gameBoardFrame = CGRect.init(x: self.view.frame.origin.x, y: self.playerView.frame.height, width: self.view.frame.width, height: self.view.frame.height/2)
        
        self.gameBoard = GameBoard.init(frame: gameBoardFrame)
        self.view.addSubview(gameBoard)
        
    }
    
    func displayControlPanel() {
        
        /** Properties **/
        let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
        
        let controlPanelFrame = CGRect.init(x: self.view.frame.origin.x, y: self.gameBoard.frame.height + self.playerView.frame.height, width: self.view.frame.width, height: availableHeight)
        
        
        /** Custom Methods **/
        
        self.controlPanel = ControlPanel.init(frame: controlPanelFrame)
        self.view.addSubview(controlPanel)
        
    }
    
    func displayUndoBtn() {
        
        /** Properties **/
        let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
        
        let undoBtnFrame = CGRect.init(x: self.view.frame.origin.x, y: self.controlPanel.frame.origin.y, width: self.controlPanel.frame.width * 0.25, height: availableHeight)
        
        /** Custom Methods **/
        //        self.undoBtn = ControlPanelBtn.init(frame: undoBtnFrame)
        self.undoBtn = ControlPanelBtn.init(frame: undoBtnFrame, andColor: .red, andText: "UNDO")
        self.view.addSubview(undoBtn)
        
    }
    
    func displayResetBtn() {
        
        /** Properties **/
        let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
        
        let resetBtnFrame = CGRect.init(x: self.controlPanel.frame.width * 0.25, y: self.controlPanel.frame.origin.y, width: self.controlPanel.frame.width * 0.50, height: availableHeight)
        
        // I think there is an issue with my x-axis float... I think I set it wrong.
        
        // some sort of property for title.text
        // some sort of property for titleColor.color
        
        /** Custom Methods **/
        //        self.resetBtn = ControlPanelBtn.init(frame: resetBtnFrame)
        self.resetBtn = ControlPanelBtn.init(frame: resetBtnFrame, andColor: .yellow, andText: "RESET")
        self.view.addSubview(resetBtn)
        
    }
    
    func displayRedoBtn() {
        
        /** Properties **/
        let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
        
        let redoBtnFrame = CGRect.init(x: self.controlPanel.frame.width * 0.75, y: self.controlPanel.frame.origin.y, width: self.controlPanel.frame.width * 0.25, height: availableHeight)
        
        
        // some sort of property for title.text
        // some sort of property for titleColor.color
        
        /** Custom Methods **/
        
        //        self.redoBtn = ControlPanelBtn.init(frame: redoBtnFrame)
        self.redoBtn = ControlPanelBtn.init(frame: redoBtnFrame, andColor: .blue, andText: "REDO")
        self.view.addSubview(redoBtn)
        
    }

}
