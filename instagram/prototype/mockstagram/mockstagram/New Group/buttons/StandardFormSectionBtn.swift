//
//  StandardFormSectionBtn.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/18/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol StandardFormSectionBtnDelegate: class
{
    func btnPressed(_ sender : StandardFormSectionBtn)
}

@IBDesignable
class StandardFormSectionBtn: UIButton
{
    /** Properties **/
    var topDivider = UIView()
    var botDivider = UIView()
    var borders : [UIView] = []
    
    weak var btnDelegate : StandardFormSectionBtnDelegate?
    
    /** Overrides **/
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /** Custom methods **/
    func commonInit()
    {
        self.borders = [topDivider, botDivider]
        
        for border in borders
        {
            self.addSubview(border)
            border.translatesAutoresizingMaskIntoConstraints = false
            border.backgroundColor = UIColor(hexFromString: "#CCCCCC")
            switch border
            {
            case topDivider:
                setBorderConstraints(forBorder: border, isTop: true)
                break
            default:
                setBorderConstraints(forBorder: border)
            }
        }
        
        self.contentEdgeInsets = UIEdgeInsets(
            top: 0, left: theme.primaryStackSpacingX * 2,
            bottom: 0, right: theme.primaryStackSpacingX * 2
        )
        
        self.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
    }
    
    func setBorderConstraints(forBorder: UIView, isTop: Bool = false)
    {
        let leadingConst = NSLayoutConstraint(
            item: forBorder, attribute: .leading,
            relatedBy: .equal, toItem: self, attribute: .leading,
            multiplier: 1, constant: 0
        )
        let trailingConst = NSLayoutConstraint(
            item: forBorder, attribute: .trailing,
            relatedBy: .equal, toItem: self, attribute: .trailing,
            multiplier: 1, constant: 0
        )
        var verticalConst = NSLayoutConstraint(
            item: forBorder, attribute: .bottom,
            relatedBy: .equal, toItem: self, attribute: .bottom,
            multiplier: 1, constant: 0
        )
        let heightConst = NSLayoutConstraint(
            item: forBorder, attribute: .height,
            relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
            multiplier: 1, constant: 1
        )
        
        if (isTop)
        {
            verticalConst = NSLayoutConstraint(
                item: forBorder, attribute: .top,
                relatedBy: .equal, toItem: self, attribute: .top,
                multiplier: 1, constant: 0
            )
        }
        
        self.addConstraints([
            leadingConst, trailingConst, verticalConst, heightConst
        ])
    }
    
    @objc func btnPressed(_ sender: UIButton)
    {
        btnDelegate?.btnPressed(self)
    }
}
