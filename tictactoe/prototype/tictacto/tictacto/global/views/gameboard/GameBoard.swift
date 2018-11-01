//
//  GameBoard.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol GameBoardDelegate : class
{
    func foundThreeInARow(forPlayer: String)
    func filledWithoutThreeInARow()
    func readyForNextTurn()
}

@IBDesignable
class GameBoard: GameSectionView
{
	/** Properties **/
	@IBOutlet var contentView: UIView!
    @IBOutlet var btnContainerView: UIView!
	
    var symbolToDraw : String = "X"
    var btns : [GamePieceButton] = []
    var btnsHorizontal : [[GamePieceButton]] = []
    var btnsVertical : [[GamePieceButton]] = []
    var btnsDiagonal : [[GamePieceButton]] = [[]]
    var numRows : Int = 0
    weak var boardDelegate : GameBoardDelegate?
    
    /** Overrides **/
    override func commonInit()
    {
        let bundle = Bundle.init(for: GameBoard.self)
		bundle.loadNibNamed(
			String.init(describing: GameBoard.self), owner:  self, options: nil)
		self.addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
        loadBtnsToCheck()
    }
    
    override func beginTurn()
    {
        super.beginTurn()
        for btn in btns { btn.enable() }
    }
    
    override func endTurn()
    {
        super.endTurn()
        for btn in btns { btn.disable() }
    }
    
    override func end(winner: String?)
    {
        self.endTurn()
    }
    
    override func reset()
    {
        symbolToDraw = "X"
        for btn in btns
        {
            btn.setTitle("", for: .normal)
            btn.enable()
        }
    }
    
    /** Custom methods **/
    func updateSymbolToDraw()
    {
        switch symbolToDraw
        {
        case "X":
            symbolToDraw = "O"
            break
        default:
            symbolToDraw = "X"
        }
    }
    
    func loadBtnsToCheck()
    {
        for view in btnContainerView.subviews
        {
            if let btn = view as? GamePieceButton
            {
                btns.append(btn)
                btn.btnDelegate = self
            }
        }
        
        numRows = Int(Float(btns.count).squareRoot())
        
        for rowOrColNum in stride(from: 1, through: numRows, by: 1)
        {
            btnsHorizontal.append(btns.filter{ $0.row == rowOrColNum })
            btnsVertical.append(btns.filter{ $0.column == rowOrColNum })
            
            let diagonalFilter = btns.filter{
                $0.row == rowOrColNum && $0.column == numRows - (rowOrColNum - 1)
            }
            if let match = diagonalFilter.first
            {
                btnsDiagonal[0].append(match)
            }
        }
        btnsDiagonal.append(btns.filter{ $0.row == $0.column })
    }
    
    func checkForThreeInARow() -> Bool
    {
        if (findThree(direction: "horizontal"))
        {
            return true
        }
        else if (findThree(direction: "vertical"))
        {
            return true
        }
        else if (findThree(direction: "diagonal"))
        {
            return true
        }
        return false // no matches found
    }
    
    func findThree(direction: String) -> Bool
    {
        var rowsToCheck : [[GamePieceButton]] = []
        switch direction
        {
        case "horizontal":
            rowsToCheck = btnsHorizontal
            break
        case "vertical":
            rowsToCheck = btnsVertical
            break
        default:
            rowsToCheck = btnsDiagonal
        }
        
        for btnRow in rowsToCheck
        {
            let symbolToMatch = btnRow[0].title(for: .normal) ?? ""
            let matches = btnRow.filter
            {
                $0.title(for: .normal)?.contains(symbolToMatch) == true
            }.count
            
            if matches >= numRows && symbolToMatch.count > 0
            {
                return true
            }
        }
        
        return false
    }
}

extension GameBoard : GamePieceButtonDelegate
{
    func gamePieceTitleUpdated(_ sender: GamePieceButton) {
        if (!checkForThreeInARow())
        {
            updateSymbolToDraw()
            boardDelegate?.readyForNextTurn()
        }
        else
        {
            boardDelegate?.foundThreeInARow(forPlayer: symbolToDraw)
        }
    }
    
	func gamePieceTapped(_ sender: GamePieceButton)
	{
        endTurn()
        sender.draw(symbol: symbolToDraw)
    }
}
