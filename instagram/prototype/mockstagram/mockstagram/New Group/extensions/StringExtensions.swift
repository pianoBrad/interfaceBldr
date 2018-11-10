//
//  StringExtensions.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/15/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect, options: .usesLineFragmentOrigin,
            attributes: [.font: font], context: nil
        )
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat
    {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(
            with: constraintRect, options: .usesLineFragmentOrigin,
            attributes: [.font: font], context: nil
        )
        
        return ceil(boundingBox.width)
    }
    
    func replacingFirstOccurrence(
        of string: String, with replacement: String) -> String
    {
        guard let range = self.range(of: string) else { return self }
        return replacingCharacters(in: range, with: replacement)
    }
}
