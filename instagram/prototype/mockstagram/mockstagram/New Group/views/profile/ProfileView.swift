//
//  ProfileView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ProfileView: UIView
{
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    @IBOutlet weak var postsStatsView: ProfileStatsView!
    @IBOutlet weak var followersStatsView: ProfileStatsView!
    @IBOutlet weak var followingStatsView: ProfileStatsView!
    
    
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
    
    func commonInit()
    {
        Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.postsStatsView.statsDelegate = self
        self.followersStatsView.statsDelegate = self
        self.followingStatsView.statsDelegate = self
    }
}

extension ProfileView : ProfileStatsViewDelegate
{
    func statWasTapped(_ sender: ProfileStatsView)
    {
        print("Stat tapped!")
    }
}
