//
//  PlayerView.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol PlayerViewDelegate : class
{
    func nextPlayerShouldTakeTurn()
}

@IBDesignable
class PlayerView: GameSectionView
{
	/** Properties **/
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var playerXBtn: PlayerButton!
    @IBOutlet weak var playerOBtn: PlayerButton!
    @IBOutlet weak var gameStatusLabel: GameStatusLabel!
    
    weak var playersDelegate : PlayerViewDelegate?
    
	/** Overrides **/
    
    /** Custom Methods **/
    override func commonInit()
    {
        super.commonInit()
        let bundle = Bundle(for: PlayerView.self)
        bundle.loadNibNamed(
            String(describing: PlayerView.self), owner: self, options: nil)
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        playerXBtn.buttonDelegate = self
        playerOBtn.buttonDelegate = self
    }
    
    override func reset()
    {
        super.reset()
        
        playerXBtn.changeButtonState(setActive: true)
        playerOBtn.changeButtonState(setActive: false)
        gameStatusLabel.reset()
    }
    
    override func end(winner: String? = nil)
    {
        super.end()
        
        if let winningSymbol = winner
        {
            gameStatusLabel.text = "Player \(winningSymbol) wins!"
            return
        }
        
        gameStatusLabel.text = "Draw!"
    }
    
    /** Custom methods **/
    func changeActivePlayer()
    {
        playerXBtn.changeButtonState()
        playerOBtn.changeButtonState()
        
        updateCurPlayerStatus()
        playersDelegate?.nextPlayerShouldTakeTurn()
    }
    
    func updateCurPlayerStatus()
    {
        let curSymbol = playerXBtn.isActive ? "X" : "O"
        gameStatusLabel.text = "Player \(curSymbol) Turn"
    }
}

extension PlayerView: PlayerButtonDelegate
{
    func buttonTapped(_ sender: PlayerButton)
    {
    }
}
