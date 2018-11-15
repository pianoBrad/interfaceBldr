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
	var owner : Player?

	
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
		setColorAndFont()
	}
	
	
	func setColorAndFont()
	{
		self.setTitleColor(.white, for: .normal)
		self.setTitle("", for: .normal)
		self.titleLabel?.font = UIFont.init(name: "Arial", size: self.frame.width)
	}
	

	func claim(forPlayer: Player)
	{
		if self.owner == nil,
			self.isEnabled == true
		{
			self.owner = forPlayer
			self.setTitle(owner?.playerSymbol, for: .normal)
			self.isEnabled = false
		}
	}
	

	func reset()
	{
		self.owner = nil
		self.setTitle("", for: .normal)
		self.isEnabled = true
	}
	
	
    /** Actions **/
	@objc func handleBtnPress(_ sender : GamePieceButton)
	{
		btnDelegate?.gamePieceTapped(self)
	}
}


