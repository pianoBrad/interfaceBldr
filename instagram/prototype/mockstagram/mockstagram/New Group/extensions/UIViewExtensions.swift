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
}
