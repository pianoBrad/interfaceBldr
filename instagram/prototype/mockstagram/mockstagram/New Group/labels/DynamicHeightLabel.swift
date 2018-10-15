//
//  DynamicHeightLabel.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/14/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class DynamicHeightLabel: UIView
{
    /** Properties **/
    var containerView : UIView = UIView(frame: .zero)
    var label : UILabel = UILabel()
    var labelFont = UIFont(name: theme.fontNamePrimaryRegular, size: 14)!
    var variableHeightConst = NSLayoutConstraint()
    
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

    convenience init(withText: String)
    {
        self.init(frame: .zero)
        self.label.text = withText
    }
    
    convenience init(withText: String, andFont: UIFont)
    {
        self.init(frame: .zero)
        self.label.text = withText
        self.labelFont = andFont
        self.label.font = self.labelFont
    }
    
    /** Custom methods **/
    func commonInit()
    {
        self.backgroundColor = theme.bgColorPrimary
        
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(
            getContainerViewConstraints(toView: containerView, forView: self)
        )
        
        label.numberOfLines = 0
        label.font = labelFont
        containerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        var labelConstraints : [NSLayoutConstraint] =
            getFullSizeViewConstraints(toView: containerView, forView: label)
        labelConstraints.append(getLabelConstraints())
        containerView.addConstraints(labelConstraints)
        
        let heightConst = NSLayoutConstraint(
            item: self, attribute: .height, relatedBy: .equal,
            toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10
        )
        self.variableHeightConst = heightConst
        self.addConstraint(variableHeightConst)
    }
    
    func getLabelConstraints() -> NSLayoutConstraint
    {
        let heightConst = NSLayoutConstraint(
            item: label, attribute: .height,
            relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute,
            multiplier: 1, constant: 0
        )
        return heightConst
    }
    
    func resetLabelHeight(forWidth : CGFloat)
    {
        if let newHeight = self.label.text?.height(
            withConstrainedWidth: forWidth, font: self.labelFont)
        {
            self.variableHeightConst.constant = newHeight
        }
    }
}
