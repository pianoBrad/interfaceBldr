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
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(
            getContainerViewConstraints(toView: containerView, forView: self)
        )
    }
}
