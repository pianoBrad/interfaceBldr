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
    var numRows : Int = 0
    weak var boardDelegate : GameBoardDelegate?
    
    override func commonInit()
    {
        let bundle = Bundle.init(for: GameBoard.self)
		bundle.loadNibNamed(
			String.init(describing: GameBoard.self), owner:  self, options: nil)
		self.addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
        for view in btnContainerView.subviews
        {
            if let btn = view as? GamePieceButton
            {
                btns.append(btn)
                btn.btnDelegate = self
            }
        }
        
        numRows = Int(Float(btns.count).squareRoot())
    }
    
    override func beginTurn()
    {
        super.beginTurn()
        for btn in btns
        {
            btn.enable()
        }
    }
    
    override func endTurn()
    {
        super.endTurn()
        for btn in btns
        {
            btn.disable()
        }
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
    
    func checkForThreeInARow() -> Bool
    {
        if (findThreeHorizontal())
        {
            return true
        }
        else if (findThreeVertical())
        {
            return true
        }
        else if (findThreeDiagonal())
        {
            return true
        }
     
        return false // draw
    }
    
    func findThreeHorizontal() -> Bool
    {
        for row in stride(from: 1, through: numRows, by: 1)
        {
            var btnRow = get(row: row)

            let matches = btnRow.filter{$0 == btnRow[0]}.count
            
            if matches >= numRows && btnRow[0].count > 0
            {
                return true
            }
        }
        
        return false
    }
    
    func get(row: Int = 1) -> [String]
    {
        var btnRow : [String] = []
        for btn in btns
        {
            if btn.row == row
            {
                btnRow.append(btn.title(for: .normal) ?? "")
            }
        }
        return btnRow
    }
    
    func findThreeVertical() -> Bool
    {
        for col in stride(from: 1, through: numRows, by: 1)
        {
            var btnCol = get(column: col)
            
            let matches = btnCol.filter{$0 == btnCol[0]}.count
            
            if matches >= numRows && btnCol[0].count > 0
            {
                return true
            }
        }
        
        return false
    }
    
    func get(column: Int = 1) -> [String]
    {
        var btnCol : [String] = []
        for btn in btns
        {
            if btn.column == column
            {
                btnCol.append(btn.title(for: .normal) ?? "")
            }
        }
        return btnCol
    }
    
    func findThreeDiagonal() -> Bool
    {
        let diagonals = [
            getDiagonal(),
            getDiagonal(startRow: numRows)
        ]
        
        for diagonal in diagonals
        {
            let matches = diagonal.filter{$0 == diagonal[0]}.count
            
            if matches >= numRows && diagonal[0].count > 0
            {
                return true
            }
        }
        
        return false
    }
    
    func getDiagonal(startRow: Int = 1) -> [String]
    {
        var btnGroup : [String] = []
        let nextRowIterator = startRow > 1 ? -1 : 1
        var curRow = startRow
        var curCol = 1
        
        for _ in stride(from: 1, through: numRows, by: 1)
        {
            for btn in btns
            {
                if btn.column == curCol && btn.row == curRow
                {
                    btnGroup.append(btn.title(for: .normal) ?? "")
                    curRow += nextRowIterator
                    curCol += 1
                }
            }
        }
        return btnGroup
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
