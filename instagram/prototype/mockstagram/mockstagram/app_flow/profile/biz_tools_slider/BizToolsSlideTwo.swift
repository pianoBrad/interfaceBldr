//
//  BizToolsSlideTwo.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/20/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class BizToolsSlideTwo: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    
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
    
    /** Custom methods **/
    func commonInit()
    {
        let bundle = Bundle(for: BizToolsSlideTwo.self)
        bundle.loadNibNamed(String(
            describing: BizToolsSlideTwo.self), owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
