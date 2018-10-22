//
//  HamburgerMenuItemView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/22/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class HamburgerMenuItemView: UIView
{
    /** Properties **/
    var titleLabel = UILabel()
    var iconSize : CGFloat = 50
    @IBInspectable var menuTitle: String = "Menu Item"
    {
        didSet
        {
            setMenuTitle(withText: menuTitle)
        }
    }
    
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
        self.titleLabel.text = menuTitle
        self.titleLabel.font = UIFont(name: theme.fontNamePrimaryRegular, size: 16)
        self.addSubview(titleLabel)
        setupLabelConstraints()
    }
    
    func setMenuTitle(withText: String)
    {
        self.titleLabel.text = withText
    }
    
    func setupLabelConstraints()
    {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let topConst = NSLayoutConstraint(
            item: titleLabel, attribute: .top,
            relatedBy: .equal, toItem: self, attribute: .top,
            multiplier: 1, constant: 0
        )
        let leadingConst = NSLayoutConstraint(
            item: titleLabel, attribute: .leading,
            relatedBy: .equal, toItem: self, attribute: .leading,
            multiplier: 1, constant: self.iconSize
        )
        let botConst = NSLayoutConstraint(
            item: titleLabel, attribute: .bottom,
            relatedBy: .equal, toItem: self, attribute: .bottom,
            multiplier: 1, constant: 0
        )
        let trailingConst = NSLayoutConstraint(
            item: titleLabel, attribute: .trailing,
            relatedBy: .equal, toItem: self, attribute: .trailing,
            multiplier: 1, constant: 0
        )
        
        self.addConstraints([
            topConst, trailingConst, botConst, leadingConst
        ])
    }
}
