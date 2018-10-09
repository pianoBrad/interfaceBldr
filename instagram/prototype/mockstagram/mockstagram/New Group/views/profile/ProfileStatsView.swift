//
//  ProfileStatsView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileStatsView: UIView
{
    var statNameText : String = "stat"
    var statNameLabel : UILabel!
    var statLabelHeight : CGFloat = 15
    var statNameFontSize : CGFloat = 12
    
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

    override func prepareForInterfaceBuilder()
    {
        setupLabels()
    }
    
    /** Custom methods **/
    func commonInit()
    {
        setupLabels()
    }
    
    func setupLabels()
    {
        let nameLabel = UILabel(frame: .zero)
        
        nameLabel.textAlignment = .center
        nameLabel.textColor = theme.lightGrey
        nameLabel.font = UIFont(name: theme.fontNamePrimaryRegular, size: statNameFontSize)
        nameLabel.text = statNameText
        
        statNameLabel = nameLabel
        place(view: statNameLabel, withHeight: statLabelHeight)
    }
    
    func place(view: UIView, withHeight: CGFloat, aboveView: UIView? = nil)
    {
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConst = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConst = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let heightConst = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: withHeight)
        var botConst = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        if let bottomView = aboveView as UIView?
        {
            botConst = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: 0)
        }
        
        self.addConstraints([leadingConst, botConst, trailingConst, heightConst])
    }
}
