//
//  ProfileFollowersListView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/14/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ProfileFollowersListView: StandardStackSubView
{
    /** Properties **/
    var followersList : [String] = []
    
    /** Overrides **/
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    convenience init(withFollowers: [String])
    {
        self.init(frame: .zero)
        self.followersList = withFollowers
    }
    
    override func commonInit()
    {
        super.commonInit()
        self.containerView.backgroundColor = .brown
    }
    
    /** Custom methods **/
}
