//
//  UIViewExtensions.swift
//  mockstagram
//
//  Created by Brad Phillips on 9/24/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // This adds a function that all sub-classes of UIView can grab onto
    func instantiateFromXib(named: String, forView: UIView) -> UIView
    {
        guard let view = Bundle.main.loadNibNamed(named, owner: self, options: nil)?.first as? UIView else {
            
            fatalError("Could not load view from xib file. Check xib named: \(named)")
        }
        
        return view
    }
    
    // Provides a container view for common elements in the main stack
    func getContainerViewConstraints(toView: UIView, forView: UIView) -> [NSLayoutConstraint]
    {        
        let topConst = NSLayoutConstraint(
            item: toView, attribute: .top,
            relatedBy: .equal, toItem: forView, attribute: .top,
            multiplier: 1, constant: 0
        )
        let botConst = NSLayoutConstraint(
            item: toView, attribute: .bottom,
            relatedBy: .equal, toItem: forView, attribute: .bottom,
            multiplier: 1, constant: 0
        )
        let widthConst = NSLayoutConstraint(
            item: toView, attribute: .width,
            relatedBy: .equal, toItem: forView, attribute: .width,
            multiplier: 1, constant: -(theme.primaryStackSpacingX * 2)
        )
        widthConst.priority = UILayoutPriority(rawValue: 999)
        let heightConst = NSLayoutConstraint(item: toView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
        let centerXConst = NSLayoutConstraint(item: toView, attribute: .centerX, relatedBy: .equal, toItem: forView, attribute: .centerX, multiplier: 1, constant: 0)
        
        return [topConst, botConst, widthConst, heightConst, centerXConst]
    }
    
    func getFullSizeViewConstraints(toView: UIView, forView: UIView) -> [NSLayoutConstraint]
    {
        let leadingConst = NSLayoutConstraint(
            item: toView, attribute: .leading,
            relatedBy: .equal, toItem: forView, attribute: .leading,
            multiplier: 1, constant: 0
        )
        let topConst = NSLayoutConstraint(
            item: toView, attribute: .top,
            relatedBy: .equal, toItem: forView, attribute: .top,
            multiplier: 1, constant: 0
        )
        let botConst = NSLayoutConstraint(
            item: toView, attribute: .bottom,
            relatedBy: .equal, toItem: forView, attribute: .bottom,
            multiplier: 1, constant: 0
        )
        let widthConst = NSLayoutConstraint(
            item: toView, attribute: .width,
            relatedBy: .equal, toItem: forView, attribute: .width,
            multiplier: 1, constant: 0
        )
        
        return [leadingConst, topConst, botConst, widthConst]
    }
}
