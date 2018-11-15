//
//  MatchLineView.swift
//  tictacto
//
//  Created by Brad Phillips on 11/13/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class MatchLineView: UIView
{
    /** Properties **/
    var matchType : String = "horizontal"
    var firstMatchingBtn : GamePieceButton?
    var startPoint : CGPoint = CGPoint(x: 0, y: 0)
    var endPoint : CGPoint = CGPoint(x: 0 , y: 0)
    
    /** Overrides **/
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect)
    {
        drawLine()
    }
    
    convenience init(with matchType: String, startingWith btn: GamePieceButton)
    {
        self.init(frame: .zero)
        self.firstMatchingBtn = btn
        self.matchType = matchType
    }
    
    override func didMoveToSuperview()
    {
        self.setupConstraints()
    }
    
    /** Custom methods **/
    func drawLine()
    {
        guard
            let firstBtn = self.firstMatchingBtn,
            self.frame.width > 0,
            self.frame.height > 0
        else
        {
            return
        }
        
        switch self.matchType
        {
        case "vertical":
            self.startPoint = CGPoint(
                x: firstBtn.frame.origin.x + (firstBtn.frame.width/2),
                y: 0
            )
            self.endPoint = CGPoint(
                x: firstBtn.frame.origin.x + (firstBtn.frame.width/2),
                y: self.frame.height
            )
            break
        case "diagonalTop":
            self.startPoint = CGPoint(x: 0, y: 0)
            self.endPoint = CGPoint(x: self.frame.width, y: self.frame.height)
            break
        case "diagonalBottom":
            self.startPoint = CGPoint(x: 0, y: self.frame.height)
            self.endPoint = CGPoint(x: self.frame.width, y: 0)
            break
        default: // horizontal
            self.startPoint = CGPoint(
                x: 0,
                y: firstBtn.frame.origin.y + (firstBtn.frame.height/2)
            )
            self.endPoint = CGPoint(
                x: self.frame.width,
                y: firstBtn.frame.origin.y + (firstBtn.frame.height/2)
            )
            break
        }
        
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x: self.startPoint.x, y:self.startPoint.y))
        
        aPath.addLine(to: CGPoint(x:self.endPoint.x, y:self.endPoint.y))
        
        aPath.close()
        
        UIColor.red.setStroke()
        aPath.lineWidth = 5.0
        aPath.stroke()
    }
    
    func setupConstraints()
    {
        guard
            let parent = self.superview
        else
        {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let topConst = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parent, attribute: .top, multiplier: 1, constant: 0)
        let leadingConst = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: parent, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConst = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: parent, attribute: .trailing, multiplier: 1, constant: 0)
        let botConst = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parent, attribute: .bottom, multiplier: 1, constant: 0)
        
        parent.addConstraints([
            topConst, leadingConst, trailingConst, botConst
        ])
        
    }
}
