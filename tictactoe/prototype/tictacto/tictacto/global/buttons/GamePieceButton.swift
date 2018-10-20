//
//  GamePieceButton.swift
//  tictacto
//
//  Created by Keithon Stribling on 10/19/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class GamePieceButton: UIButton
{

	/** Properties **/
	@IBInspectable var  btnColor : UIColor = .black
	{
		didSet
		{
			self.setBGColor(color: btnColor)
		}
	}
	
	
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
		self.backgroundColor = .yellow
	}
	
	func setBGColor(color: UIColor)
	{
		self.backgroundColor = color
	}
	
}
