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
    func foundThreeInARow(forPlayer: Player)
    func filledWithoutThreeInARow()
    func readyForNextTurn()
    func matchingAnimationComplete()
}

@IBDesignable
class GameBoard: GameSectionView
{
	/** Properties **/
	@IBOutlet var contentView: UIView!
    @IBOutlet var btnContainerView: UIView!
    
    var btns : [GamePieceButton] = []
    var btnFrames : [CGRect] = []
    var btnsHorizontal : [[GamePieceButton]] = []
    var btnsVertical : [[GamePieceButton]] = []
    var btnsDiagonal : [[GamePieceButton]] = [[]]
    var matchingRow : [String : [GamePieceButton]] = [:]
    var numRows : Int = 0
    var matchingLine : MatchLineView?
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
    
    override func end()
    {
        self.endTurn()
        self.animateMatch()
    }
    
    override func reset()
    {
        for view in btnContainerView.subviews
        {
            if let lineView = view as? MatchLineView
            {
                lineView.removeFromSuperview()
                break
            }
            
            if let btnView = view as? GamePieceButton
            {
                btnView.reset()
            }
        }
        
        for (key, btn) in btns.enumerated()
        {
            btn.frame = btnFrames[key]
        }
    }
    
    /** Custom methods **/
    func loadBtnsToCheck()
    {
        for view in btnContainerView.subviews
        {
            if let btn = view as? GamePieceButton
            {
                btns.append(btn)
                btn.btnDelegate = self
                btnFrames.append(btn.frame)
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
        if (findThree(direction: "horizontal")
            || findThree(direction: "vertical")
            || findThree(direction: "diagonal"))
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
                self.matchingRow = [direction : btnRow]
                return true
            }
        }

        return false
    }
    
    func checkIsBoardFilled() -> Bool
    {
        for btn in btns
        {
            if !btn.hasBeenPlayed()
            {
                return false
            }
        }
        
        return true
    }
    
    func animateMatch()
    {
        guard
            let matchingRow = self.matchingRow.first?.value
        else
        {
            print("no matching data found..can't draw line")
            return
        }
        
        for (direction, _) in self.matchingRow
        {
            let matchLine = MatchLineView(
                with: direction, for: matchingRow)
            matchLine.lineDelegate = self
            self.matchingLine = matchLine
            
            self.btnContainerView.addSubview(
                matchLine
            )
        }
    }
}

extension GameBoard : GamePieceButtonDelegate
{
    func gamePieceTitleUpdated(_ sender: GamePieceButton)
    {
        if !checkForThreeInARow()
        {
            if checkIsBoardFilled()
            {
                boardDelegate?.filledWithoutThreeInARow()
                return
            }
            
            boardDelegate?.readyForNextTurn()
        }
        else if let curPlayer = currentGame.getCurrentPlayer()
        {
            boardDelegate?.foundThreeInARow(forPlayer: curPlayer)
        }
    }
    
	func gamePieceTapped(_ sender: GamePieceButton)
	{
        if sender.hasBeenPlayed() {
            return
        }
        else if let curPlayer = currentGame.getCurrentPlayer()
        {
            endTurn()
            sender.mark(forPlayer: curPlayer)
        }
    }
}

extension GameBoard : MatchLineViewDelegate
{
    func lineAddedToSuperView(_ sender: MatchLineView)
    {
        sender.animateLine()
    }
    
    func lineDrawComplete(_ sender: MatchLineView)
    {
        guard
            let matchingBtns = self.matchingRow.first?.value,
            let line = self.matchingLine,
            let newLineFrame = line.getLineFrameForWin(),
            matchingBtns.count > 0
        else
        {
            return
        }
        
        let boardCenter = self.convert(
            self.contentView.center, to: self.btnContainerView)
        let animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeInOut)
        
        animator.addAnimations
        {
            line.frame = newLineFrame
            line.center = boardCenter
            
            for (_, btns) in self.matchingRow
            {
                for btn in btns
                {
                    btn.center = boardCenter
                }
            }
        }
        
        animator.startAnimation()
    }
}
