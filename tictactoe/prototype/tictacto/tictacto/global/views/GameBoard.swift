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
        
        /****************BRAD_KNOWLEDGE******************
        Another way of doing btnsArray assignment (below)
         
        for view in btnContainerView.subviews
        {
            if let btn = view as? GamePieceButton
            {
                btnsArray.append(btn)
            }
        }
        **************************************************/
        
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
	
	func checkThreeInRow()
	{
		
		let btnRows =
			[
				[0,1,2,],
				[3,4,5,],
				[6,7,8,],
			]
		
		for horizontalRow in btnRows
		{
			if let firstOwner = btnsArray[horizontalRow[0]].owner
			{
				for btnKey in horizontalRow
				{
					let btnOwner = btnsArray[btnKey].owner
					
					if btnOwner != firstOwner
					{
						if horizontalRow == btnRows.last
						{
							boardDelegate?.noMatchFound()
							return
						}
						break
					}
					
					if btnKey == horizontalRow.last
					{
						boardDelegate?.matchFound(for: firstOwner)
						return
					}
				}
			}
				
			else if horizontalRow == btnRows.last
			{
				boardDelegate?.noMatchFound()
				return
			}
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
