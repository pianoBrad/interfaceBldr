//
//  StatView.swift
//  tableOrScroll
//
//  Created by Brad Phillips on 1/8/19.
//  Copyright © 2019 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class StatView: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet var statTitleLabel: UILabel!
    @IBOutlet var statValueLabel: UILabel!
    
    @IBInspectable var statLabelText : String = "Title"
    {
        didSet
        {
            self.statTitleLabel.text = statLabelText
        }
    }
    
    @IBInspectable var statValueText : String = "100"
    {
        didSet
        {
            self.statValueLabel.text = statValueText
        }
    }
    
    /** Overrides **/
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    /** Custom methods **/
    
    func commonInit()
    {
        let bundle = Bundle(for: StatView.self)
        bundle.loadNibNamed(String(
            describing: StatView.self), owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
