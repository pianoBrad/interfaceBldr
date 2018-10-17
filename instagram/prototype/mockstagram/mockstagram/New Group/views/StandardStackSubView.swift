//
//  StandardStackView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/14/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class StandardStackSubView: UIView
{
    /** Properties **/
    var containerView = ContainerView()
    
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
        self.addSubview(containerView)
        self.backgroundColor = theme.bgColorPrimary
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(
            getContainerViewConstraints(toView: containerView, forView: self)
        )
    }
    
    func setStandardYPadding(forConstraints: [NSLayoutConstraint])
    {
        for constraint in forConstraints
        {            
            if let containerView = constraint.firstItem,
                containerView.classForCoder == ContainerView.self
            {
                switch (constraint.firstAttribute.rawValue)
                {
                case 3: // top
                    constraint.constant = theme.primaryStackSpacingY
                    break
                case 4: // bottom
                    constraint.constant = -theme.primaryStackSpacingY
                    break
                default:
                    break
                }
            }
        }
    }
    
    func setContainerHeight(toValue: CGFloat)
    {
        for constraint in self.constraints
        {
            if let containerView = constraint.firstItem,
                containerView.classForCoder == ContainerView.self
            {
                switch constraint.firstAttribute.rawValue
                {
                case 8: // height
                    constraint.constant = toValue
                    break
                default:
                    break
                }
            }
        }
    }
}
