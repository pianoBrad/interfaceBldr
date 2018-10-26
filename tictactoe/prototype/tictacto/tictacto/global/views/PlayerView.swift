//
//  PlayerView.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class PlayerView: UIView
{
	/** Properties **/
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var playerXBtn: PlayerButton!
    @IBOutlet weak var playerOBtn: PlayerButton!
    @IBOutlet weak var gameStatusLabel: UILabel!
    
	/** Overrides **/
	override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /** Custom Methods **/
    func commonInit()
    {
        let bundle = Bundle(for: PlayerView.self)
        bundle.loadNibNamed(
            String(describing: PlayerView.self), owner: self, options: nil)
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
