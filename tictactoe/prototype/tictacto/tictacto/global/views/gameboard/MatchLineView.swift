//
//  MatchLineView.swift
//  tictacto
//
//  Created by Brad Phillips on 11/13/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol MatchLineViewDelegate : class
{
    func lineAddedToSuperView(_ sender : MatchLineView)
    func lineDrawComplete(_ sender : MatchLineView)
}

class MatchLineView: UIView
{
    /** Properties **/
    var matchType : String = "horizontal"
    var firstMatchingBtn : GamePieceButton?
    var startPoint : CGPoint = CGPoint(x: 0, y: 0)
    var endPoint : CGPoint = CGPoint(x: 0 , y: 0)
    var widthConst : NSLayoutConstraint?
    var heightConst : NSLayoutConstraint?
    let lineAnimator = UIViewPropertyAnimator(duration: 0.4, curve: .easeInOut)
    
    weak var lineDelegate : MatchLineViewDelegate?
    
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
        self.setupStartingConstraints()
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
    
    func setupStartingConstraints()
    {
        guard
            let parent = self.superview
        else
        {
            return
        }
        
        var widthConstant : CGFloat = 0
        var heightConstant : CGFloat = 0
        
        switch self.matchType
        {
        case "vertical":
            widthConstant = parent.frame.height
            break
        default: // horizontal
            heightConstant = parent.frame.width
            break
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let topConst = NSLayoutConstraint(
            item: self, attribute: .top,
            relatedBy: .equal, toItem: parent, attribute: .top,
            multiplier: 1, constant: 0
        )
        let leadingConst = NSLayoutConstraint(
            item: self, attribute: .leading,
            relatedBy: .equal, toItem: parent, attribute: .leading,
            multiplier: 1, constant: 0
        )
        let wConst = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthConstant)
        let hConst = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightConstant)
        
        self.widthConst = wConst
        self.heightConst = hConst
        parent.addConstraints([
            topConst, leadingConst, wConst, hConst
        ])
        parent.layoutIfNeeded()
        
        lineDelegate?.lineAddedToSuperView(self)
    }
    
    func animateLine()
    {
        guard
            let parent = self.superview,
            let wConst = self.widthConst,
            let hConst = self.heightConst
        else
        {
            return
        }
        
        self.lineAnimator.addAnimations {
            switch self.matchType
            {
            case "vertical":
                hConst.constant = parent.frame.height
                break
            default: //horizontal
                wConst.constant = parent.frame.width
                break
            }
            
            parent.layoutIfNeeded()
        }
        
        self.lineAnimator.addCompletion
        {
            _ in
            
            self.lineDelegate?.lineDrawComplete(self)
        }
        
        self.lineAnimator.startAnimation()
    }
}
