//
//  Player.swift
//  tictacto
//
//  Created by Brad Phillips on 11/1/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class Player: NSObject
{
    /** Properties **/
    public var btn : PlayerButton?
    public var symbol : String = "X"
    
    /** Overrides **/
    override init() {}
    
    convenience init(withButton: PlayerButton)
    {
        self.init()
        self.btn = withButton
        if let btnSymbol = withButton.playerNameLabel.text
        {
            self.symbol = btnSymbol
        }
    }
    
    /** Custom methods **/
}
