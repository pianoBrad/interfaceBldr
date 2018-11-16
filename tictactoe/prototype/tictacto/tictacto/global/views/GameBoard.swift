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
	
	override func reset()
	{
		super.reset()
		
		for btn in btnsArray
		{
			btn.reset()
		}
	}
	
	/** Custom Methods **/
	func findMatch(in btnRows: [[Int]]) -> Bool
	{
		for row in btnRows
		{
			if let firstOwner = btnsArray[row[0]].owner
			{
				for btnKey in row
				{
					let btnOwner = btnsArray[btnKey].owner
					
					if btnOwner != firstOwner
					{
						if row == btnRows.last
						{
							return false
						}
						break
					}
					if btnKey == row.last
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
		let btnRows =
		[
			[0,1,2,],
			[3,4,5,],
			[6,7,8,],
		]
		
		let btnColumns =
		[
			[0,3,6,],
			[1,4,7,],
			[2,5,8,],
		]
		
		let btnDiags =
		[
			[0,4,8,],
			[2,4,6,],
		]
		
		guard
			let currentPlayer = currentGame.getCurrentPlayer()
		else
		{
			return
		}
		
		if (
			findMatch(in: btnRows)
			|| findMatch(in: btnColumns)
			|| findMatch(in: btnDiags)
		)
		{
			boardDelegate?.matchFound(for: currentPlayer)
		}
		else
		{
			boardDelegate?.noMatchFound()
		}
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
