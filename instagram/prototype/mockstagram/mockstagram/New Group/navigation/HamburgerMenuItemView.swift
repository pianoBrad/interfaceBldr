//
//  HamburgerMenuItemView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/22/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol HamburgerMenuItemViewDelegate: class
{
    func menuItemTapped(_ sender: HamburgerMenuItemView)
}

@IBDesignable
class HamburgerMenuItemView: UIView
{
    /** Properties **/
    var titleLabel = UILabel()
    var iconView = UIImageView()
    var iconWidth : CGFloat = 50
    var iconHeight : CGFloat = 24
    @IBInspectable var menuTitle: String = "Menu Item"
    {
        didSet
        {
            setMenuTitle(withText: menuTitle)
        }
    }
    @IBInspectable var iconImage : UIImage!
    {
        didSet
        {
            setIconViewImage(withImage: iconImage)
        }
    }
    @IBInspectable var segueID : String = ""
    
    weak var itemDelegate : HamburgerMenuItemViewDelegate?
    
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
        
        self.iconView.contentMode = .scaleAspectFit
        self.iconView.image = self.iconImage
        self.addSubview(iconView)
        setupIconViewConstraints()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(gesture)
    }
    
    func setMenuTitle(withText: String)
    {
        self.titleLabel.text = withText
    }
    
    func setIconViewImage(withImage: UIImage)
    {
        self.iconView.image = withImage
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
            multiplier: 1, constant: self.iconWidth
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
    
    func setupIconViewConstraints()
    {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConst = NSLayoutConstraint(item: iconView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let widthConst = NSLayoutConstraint(item: iconView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: iconWidth)
        let heightConst = NSLayoutConstraint(item: iconView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: iconHeight)
        let centerYConst = NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        self.addConstraints([
            leadingConst, widthConst, heightConst, centerYConst
        ])
    }
    
    /** Actions **/
    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        self.itemDelegate?.menuItemTapped(self)
    }
}
