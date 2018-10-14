//
//  ProfileOccupationView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/14/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ProfileOccupationView: UIView
{
    /** Properties **/
    let containerView = UIView()
    let occupationLabel = UILabel()
    let labelHeight : CGFloat = 17
    
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
    
    convenience init(withTitle: String)
    {
        self.init(frame: .zero)
        setOccupation(withTitle: withTitle)
    }
    
    /** Custom methods **/
    func commonInit()
    {
        self.backgroundColor = theme.bgColorPrimary
        // Add container view
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(
            getContainerViewConstraints(toView: containerView, forView: self)
        )
        
        occupationLabel.font = UIFont(
            name: theme.fontNamePrimaryRegular, size: 14
        )
        occupationLabel.textColor = theme.lightGrey
        occupationLabel.text = "occupation"
        containerView.addSubview(occupationLabel)
        occupationLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addConstraints(
            getFullSizeViewConstraints(
                toView: occupationLabel, forView: containerView
            )
        )
        setOccupationConstraints(forView: containerView)
    }
    
    func setOccupation(withTitle: String)
    {
        occupationLabel.text = withTitle
    }
    
    func setOccupationConstraints(forView: UIView)
    {
        let heightConst = NSLayoutConstraint(
            item: occupationLabel, attribute: .height,
            relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
            multiplier: 1, constant: labelHeight
        )
        
        forView.addConstraint(heightConst)
    }
}
