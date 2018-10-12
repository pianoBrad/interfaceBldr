//
//  UIStackViewExtensions.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import Foundation
import UIKit

// Fully removes objects from a stack & subview, if set to true
extension UIStackView {
    func removeArrangedSubview(_ view: UIView, shouldRemoveFromSuperview: Bool) {
        removeArrangedSubview(view)
        if shouldRemoveFromSuperview {
            view.removeFromSuperview()
        }
    }
}
