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
    }
    
    override func reset()
    {
        super.reset()
        // Handle reset biz
        // Make sure playerX is active
        // Reset gamestatus text
    }
    
    override func end()
    {
        super.end()
        // Change gamestatus text to gameover text
    }
}

extension PlayerView: PlayerButtonDelegate
{
    func buttonTapped(_ sender: PlayerButton)
    {
        sender.changeButtonState()
        
        switch sender {
        case playerXBtn:
            playerOBtn.changeButtonState(setActive: !sender.isActive)
        default:
            playerXBtn.changeButtonState(setActive: !sender.isActive)
            break
        }
        
        updateCurPlayerStatus()
    }
    
    func updateCurPlayerStatus()
    {
        switch playerXBtn.isActive
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
