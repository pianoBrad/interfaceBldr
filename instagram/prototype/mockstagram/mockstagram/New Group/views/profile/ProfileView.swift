//
//  ProfileView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate : class
{
    func editProfileBtnPressed(_ sender: UIButton)
}

@IBDesignable 
class ProfileView: UIView
{
    weak var profileDelegate : ProfileViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    @IBOutlet weak var postsStatsView: ProfileHeaderStatsView!
    @IBOutlet weak var followersStatsView: ProfileHeaderStatsView!
    @IBOutlet weak var followingStatsView: ProfileHeaderStatsView!
    
    @IBOutlet weak var profileBtn: ProfileBtn!
    @IBOutlet weak var storyStack: StoryStack!
    
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
        let bundle = Bundle(for: ProfileView.self)
        bundle.loadNibNamed(
            String(describing: ProfileView.self),
            owner: self, options: nil
        )
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.postsStatsView.statsDelegate = self
        self.followersStatsView.statsDelegate = self
        self.followingStatsView.statsDelegate = self
        
        self.profileBtn.btnDelegate = self
        self.storyStack.stackDelegate = self
    }
}

extension ProfileView : ProfileHeaderStatsViewDelegate
{
    func statWasTapped(_ sender: ProfileHeaderStatsView)
    {
        print("Stat tapped!")
    }
}

extension ProfileView : ProfileBtnDelegate
{
    func btnWasPressed(_ sender: UIButton)
    {
        if (sender == self.profileBtn)
        {
            profileDelegate?.editProfileBtnPressed(sender)
        }
    }
}

extension ProfileView : StoryStackDelegate
{
    func storyTapped(_ sender: StoryBtnView) {
        print("story tapped!")
    }
}
