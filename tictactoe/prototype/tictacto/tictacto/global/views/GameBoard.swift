//
//  GameBoard.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class GameBoard: GameSectionVIew
{
	
	/** Properties **/
	@IBOutlet var contentView: UIView!
	
	@IBOutlet var btnOne: GamePieceButton!
	@IBOutlet var btnTwo: GamePieceButton!
	@IBOutlet var btnThree: GamePieceButton!
	@IBOutlet var btnFour: GamePieceButton!
	@IBOutlet var btnFive: GamePieceButton!
	@IBOutlet var btnSix: GamePieceButton!
	@IBOutlet var btnSeven: GamePieceButton!
	@IBOutlet var btnEight: GamePieceButton!
	@IBOutlet var btnNine: GamePieceButton!
	
    override func commonInit()
    {
        let bundle = Bundle.init(for: GameBoard.self)
		bundle.loadNibNamed(
			String.init(describing: GameBoard.self), owner:  self, options: nil)
		self.addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		btnOne.btnDelegate = self
		btnTwo.btnDelegate = self
		btnThree.btnDelegate = self
		btnFour.btnDelegate = self
		btnFive.btnDelegate = self
		btnSix.btnDelegate = self
		btnSeven.btnDelegate = self
		btnEight.btnDelegate = self
		btnNine.btnDelegate = self
    }
}

extension GameBoard : GamePieceButtonDelegate
{
	func gamePieceTapped(_ sender: GamePieceButton)
	{
		print("btn \(sender.titleLabel!.text) was pressed")
	}
	
	
}
