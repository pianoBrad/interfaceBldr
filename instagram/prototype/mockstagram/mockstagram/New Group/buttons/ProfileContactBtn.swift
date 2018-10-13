//
//  ProfileContactBtn.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ProfileContactBtn: UIButton
{
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
    
    convenience init(withTitle: String)
    {
        self.init(frame: .zero)
        self.setTitle(withTitle, for: .normal)
    }
    
    /** Custom methods **/
    func commonInit()
    {
        self.setTitleColor(theme.linkPrimary, for: .normal)
        self.titleLabel?.font = UIFont(
            name: theme.fontNamePrimaryRegular,
            size: 14
        )
        self.backgroundColor = .clear
    }
}
