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
    var contentLabel  = UILabel()
    
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
        self.setContainerHeight(toValue: 15)
        setStandardYPadding(forConstraints: self.constraints)
        
        
        contentLabel.textColor = theme.lightGrey
        contentLabel.font = UIFont(name: theme.fontNamePrimaryRegular, size: 11)
        contentLabel.text = "Followed by"
        
        addContentLabelToView()
    }
    
    /** Custom methods **/
    func addContentLabelToView()
    {
        self.containerView.addSubview(self.contentLabel)
        
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.addConstraints(
            getFullSizeViewConstraints(
                toView: contentLabel, forView: containerView)
        )
    }
}
