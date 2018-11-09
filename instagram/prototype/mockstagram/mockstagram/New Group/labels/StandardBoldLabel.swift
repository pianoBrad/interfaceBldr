//
//  StandardBoldLabel.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class StandardBoldLabel: UILabel
{
    /** Properties **/
    var defaultColor : UIColor = .black
    var defaultSize : CGFloat = 14.0
    
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
        self.font = UIFont(name: theme.fontNamePrimaryBold, size: defaultSize)
        self.textColor = defaultColor
    }
}
