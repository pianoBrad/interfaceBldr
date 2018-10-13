//
//  StoryBtnView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol StoryBtnViewDelegate : class
{
    func storyTapped(_ sender : StoryBtnView)
}

class StoryBtnView: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var storyBtn: UIButton!
    @IBOutlet weak var thumbnailView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var storyBtnDelegate : StoryBtnViewDelegate?
    
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
        bundle.loadNibNamed(
            String(describing: StoryBtnView.self),
            owner: self, options: nil
        )
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.storyBtn.addTarget(self, action: #selector(handleBtnPress), for: .touchUpInside)
    }
    
    @objc func handleBtnPress(_ sender: UIButton)
    {
        storyBtnDelegate?.storyTapped(self)
    }
}
