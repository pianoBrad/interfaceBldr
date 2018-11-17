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
	func matchFound(for player: Player)
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
	
	var btnRows: [[GamePieceButton]] = []
	var btnColumns: [[GamePieceButton]] = []
	var btnDiags: [[GamePieceButton]] = []
	
	
	/** Overrides **/
    override func commonInit()
    {
        let bundle = Bundle.init(for: GameBoard.self)
		bundle.loadNibNamed(
			String.init(describing: GameBoard.self), owner:  self, options: nil)
		self.addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		setupBtns()
		
    }
	
	override func reset()
	{
		super.reset()
		
		for btn in btnsArray
		{
			btn.reset()
		}
	}
	
	override func end()
	{
		disableRemainingBtns()
	}
	
	/** Custom Methods **/
	func setupBtns()
	{
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
		
		btnRows =
			[
				[btnOne, btnTwo, btnThree,],
				[btnFour, btnFive, btnSix,],
				[btnSeven, btnEight, btnNine,],
			]
		
		btnColumns =
			[
				[btnOne, btnFour, btnSeven,],
				[btnTwo, btnFive, btnEight,],
				[btnThree, btnSix, btnNine,],
			]
		
		btnDiags =
			[
				[btnOne, btnFive, btnNine,],
				[btnThree, btnFive, btnSeven,],
			]
		
		for btn in btnsArray
		{
			btn.btnDelegate = self
		}
	}
	
	func findMatch(in btnRows: [[GamePieceButton]]) -> Bool
	{
		for row in btnRows
		{
			if let firstOwner = row.first?.owner
			{
				for btn in row
				{
					let btnOwner = btn.owner
					
					if btnOwner != firstOwner
					{
						if row == btnRows.last
						{
							return false
						}
						break
					}
					if btn == row.last
					{
						return true
					}
				}
			}
			else if row == btnRows.last
			{
				return false
			}
		}
		return false
	}
	
	func checkThreeInRow()
	{
		guard
			let currentPlayer = currentGame.getCurrentPlayer()
		else
		{
			return
		}
		
		if (
			findMatch(in: self.btnRows)
			|| findMatch(in: self.btnColumns)
			|| findMatch(in: self.btnDiags)
		)
		{
			boardDelegate?.matchFound(for: currentPlayer)
		}
		else
		{
			boardDelegate?.noMatchFound()
		}
	}
	
	func allGamePiecesUsed()
	{
		
	}
	
	func disableRemainingBtns()
	{
		for btns in btnsArray
		{
			if btns.owner == nil
			{
				btns.isEnabled = false
			}
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
		
		checkThreeInRow()
		
	}
}
