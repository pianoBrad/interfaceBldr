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
    var containerView = UIView()
    
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
        print("tryint to update padding now..")
    
        for constraint in forConstraints
        {
            switch (constraint.firstAttribute.rawValue)
            {
            case 3: // top
                print("adjusting top padding now..")
                constraint.constant = theme.primaryStackSpacingY
                break
            case 4: // bottom
                print("adjusting bot padding now..")
                constraint.constant = -theme.primaryStackSpacingY
                break
            default:
                break
            }
        }
    }
}
