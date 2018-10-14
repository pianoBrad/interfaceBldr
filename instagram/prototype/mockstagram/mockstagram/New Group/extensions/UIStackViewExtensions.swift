//
//  UIStackViewExtensions.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    // Fully removes objects from a stack & subview, if set to true
    func removeArrangedSubview(_ view: UIView, shouldRemoveFromSuperview: Bool)
    {
        removeArrangedSubview(view)
        if shouldRemoveFromSuperview
        {
            view.removeFromSuperview()
        }
    }
    
    // Finds an instance of a given class and returns it's index
    func findArrangedSubview(ofClass: AnyClass) -> Int?
    {
        for (id, view) in self.arrangedSubviews.enumerated()
        {
            if view.classForCoder == ofClass
            {
                return id
            }
        }
        return nil
    }
}
