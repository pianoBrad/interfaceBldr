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
class GameBoard: GameSectionVIew
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
    
    override func end(winner: String?)
    {
        for btn in btns
        {
            btn.disable()
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
        // check rows vertically for 3 matching labels
        // check diagonals for 3 matching labels
     
        // return draw if no wins and all btn labels assigned
        return false
    }
    
    func findThreeHorizontal() -> Bool
    {
        for row in stride(from: 1, to: numRows, by: 1)
        {
            var btnRow = get(row: row)

            let matches = btnRow.filter{$0 == btnRow[0]}.count
            
            if matches >= numRows
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
                btnRow.append(btn.titleLabel?.text ?? "")
            }
        }
        return btnRow
    }
    
    func findThreeVertical() -> Bool
    {
        return false
    }
    
    func findThreeDiagonal() -> Bool
    {
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
        sender.draw(symbol: symbolToDraw)
    }
}
