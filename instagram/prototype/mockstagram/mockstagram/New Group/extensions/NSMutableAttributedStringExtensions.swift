//
//  NSMutableAttributedStringExtensions.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/10/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString
{
    @discardableResult func bold(
        _ text: String, _ size: CGFloat) -> NSMutableAttributedString
    {
        let attrs : [NSAttributedString.Key: Any] = [
            .font : UIFont(
                name: theme.fontNamePrimaryBold, size: size
                ) ?? UIFont()
        ]
        let boldString = NSMutableAttributedString(
            string:text, attributes: attrs
        )
        append(boldString)
        
        return self
    }
    
    @discardableResult func colored(_ text: String, _ color: UIColor) -> NSMutableAttributedString
    {
        let attrs : [NSAttributedString.Key: Any] = [
            .foregroundColor : theme.lightGrey
        ]
        
        let coloredString = NSMutableAttributedString(
            string: text, attributes: attrs
        )
        append(coloredString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString
    {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
