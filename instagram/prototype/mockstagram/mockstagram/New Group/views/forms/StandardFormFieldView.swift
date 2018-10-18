//
//  StandardFormFieldView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/17/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class StandardFormFieldView: StandardStackSubView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    
    /** Overrides **/
    override func commonInit()
    {
        super.commonInit()
        
        let bundle = Bundle(for: StandardFormFieldView.self)
        bundle.loadNibNamed(
            String(describing: StandardFormFieldView.self), owner: self, options: nil
        )
        containerView.addSubview(contentView)
        contentView.frame = containerView.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.setContainerHeight(toValue: 45)
    }
}
