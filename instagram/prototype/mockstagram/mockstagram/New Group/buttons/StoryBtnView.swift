//
//  StoryBtnView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class StoryBtnView: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var thumbnailView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
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
        let bundle = Bundle(for: StoryBtnView.self)
        bundle.loadNibNamed("StoryBtnView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
