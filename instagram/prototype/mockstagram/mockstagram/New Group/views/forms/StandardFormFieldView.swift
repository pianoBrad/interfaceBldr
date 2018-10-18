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
    
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var fieldValueTextField: UITextField!
    @IBOutlet weak var fieldDividerView: UIView!
    
    @IBInspectable var displayDivider : Bool = true
    {
        didSet
        {
            if (!displayDivider)
            {
                self.removeDividerView()
            }
        }
    }
    
    convenience init(withoutDivider: Bool)
    {
        self.init()
        if (withoutDivider)
        {
            removeDividerView()
        }
    }
    
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

    /** Custom methods **/
    func removeDividerView()
    {
        self.fieldDividerView.removeFromSuperview()
    }
}
