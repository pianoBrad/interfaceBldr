//
//  GamePieceButton.swift
//  tictacto
//
//  Created by Keithon Stribling on 10/19/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol GamePieceButtonDelegate: class
{
	func gamePieceTapped(_ sender : GamePieceButton)
}

@IBDesignable
class GamePieceButton: UIButton
{

	/** Properties **/
	weak var btnDelegate : GamePieceButtonDelegate?
	
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
		self.addTarget(self, action: #selector(handleBtnPress), for: .touchUpInside)
		
        // To-Do:
        // * Add additional logic:
        // * * update font size and color for button title label
		setColorAndFont()
	}
	
	
	func setColorAndFont()
	{
		self.setTitleColor(.white, for: .normal)
		self.setTitle("X", for: .normal)
		self.titleLabel?.font = UIFont.init(name: "Arial", size: self.frame.width)
		self.titleLabel?.layer.opacity = 0.0
	}
	
	
	func showText()
	{
		self.titleLabel?.layer.opacity = 100.0
	}
	
    func draw(symbol: String)
    {
        // To-Do:
        // * Complete function
        // * * given passed in property symbol, update title label
    }
	
	
    /** Actions **/
	@objc func handleBtnPress(_ sender : GamePieceButton)
	{
		btnDelegate?.gamePieceTapped(self)
		showText()
	}
}
