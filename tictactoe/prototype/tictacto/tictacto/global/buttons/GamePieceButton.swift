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
		
	}
	
	@objc func handleBtnPress(_ sender : GamePieceButton)
	{
		btnDelegate?.gamePieceTapped(self)
	}
	
	
}
