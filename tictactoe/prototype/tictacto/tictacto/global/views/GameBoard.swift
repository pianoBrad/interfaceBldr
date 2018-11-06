//
//  GameBoard.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol GameBoardDelegate: class
{
	func noMatchFound()
}

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
	
    var symbolToDraw : String = "X"
	
	var boardDelegate : GameBoardDelegate?
	
	var btnsArray : [GamePieceButton] = []
	
	/** Overrides **/
    override func commonInit()
    {
        let bundle = Bundle.init(for: GameBoard.self)
		bundle.loadNibNamed(
			String.init(describing: GameBoard.self), owner:  self, options: nil)
		self.addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		btnsArray =
		[
			btnOne,
			btnTwo,
			btnThree,
			btnFour,
			btnFive,
			btnSix,
			btnSeven,
			btnEight,
			btnNine,
		]
		
		for btn in btnsArray
		{
			btn.btnDelegate = self
		}
    }
	
	override func reset() {
		super.reset()
		
		for btn in btnsArray
		{
			btn.reset()
		}
	}
	
}

extension GameBoard : GamePieceButtonDelegate
{
	func gamePieceTapped(_ sender: GamePieceButton)
	{
		if let currentPlayer = currentGame.getCurrentPlayer() as Player?
		{
			sender.claim(forPlayer: currentPlayer)
		}
		
		boardDelegate?.noMatchFound()
		
    }
}




