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
    var labelHeight : CGFloat = 25
    var labelHeightConst = NSLayoutConstraint()
    
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
        self.label.font = labelFont
    }
    
    /** Custom methods **/
    func commonInit()
    {
        containerView.backgroundColor = .red
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(getContainerConstraints(forSuperview: self))
        
        label.backgroundColor = .yellow
        label.numberOfLines = 0
        containerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addConstraints(
            getLabelConstraints(forSuperview: containerView)
        )
        
        
        let heightConst = NSLayoutConstraint(
            item: self, attribute: .height, relatedBy: .equal,
            toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10
        )
        self.labelHeightConst = heightConst
        self.addConstraint(labelHeightConst)
    }

    func getContainerConstraints(forSuperview: UIView) -> [NSLayoutConstraint]
    {
        let leadingConst = NSLayoutConstraint(
            item: containerView, attribute: .leading,
            relatedBy: .equal, toItem: forSuperview, attribute: .leading,
            multiplier: 1, constant: 0
        )
        let trailingConst = NSLayoutConstraint(
            item: containerView, attribute: .trailing,
            relatedBy: .equal, toItem: forSuperview, attribute: .trailing,
            multiplier: 1, constant: 0
        )
        let topConst = NSLayoutConstraint(
            item: containerView, attribute: .top,
            relatedBy: .equal, toItem: forSuperview, attribute: .top,
            multiplier: 1, constant: 0
        )
        let heightConst = NSLayoutConstraint(
            item: containerView, attribute: .height,
            relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute,
            multiplier: 1, constant: labelHeight
        )
        
        return [leadingConst, trailingConst, heightConst, topConst]
    }
    
    func getLabelConstraints(forSuperview: UIView) -> [NSLayoutConstraint]
    {
        let leadingConst = NSLayoutConstraint(
            item: label, attribute: .leading,
            relatedBy: .equal, toItem: forSuperview, attribute: .leading,
            multiplier: 1, constant: theme.primaryStackSpacingX
        )
        let topConst = NSLayoutConstraint(
            item: label, attribute: .top,
            relatedBy: .equal, toItem: forSuperview, attribute: .top,
            multiplier: 1, constant: 0
        )
        let botConst = NSLayoutConstraint(
            item: label, attribute: .bottom,
            relatedBy: .equal, toItem: forSuperview, attribute: .bottom,
            multiplier: 1, constant: 0
        )
        let widthConst = NSLayoutConstraint(
            item: label, attribute: .width,
            relatedBy: .equal, toItem: forSuperview, attribute: .width,
            multiplier: 1, constant: -(theme.primaryStackSpacingX * 2)
        )
        widthConst.priority = UILayoutPriority(rawValue: 999)
        let heightConst = NSLayoutConstraint(
            item: label, attribute: .height,
            relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute,
            multiplier: 1, constant: 0
        )
        return [leadingConst, topConst, botConst, widthConst, heightConst]
    }
    
    func resetLabelHeight(forWidth : CGFloat)
    {
        if let newHeight = self.label.text?.height(
            withConstrainedWidth: forWidth, font: self.labelFont)
        {
            self.labelHeightConst.constant = newHeight
        }
    }
}
