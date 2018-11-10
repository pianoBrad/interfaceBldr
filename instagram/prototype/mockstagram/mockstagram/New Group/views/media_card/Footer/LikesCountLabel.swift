//
//  LikesCountLabel.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class LikesCountLabel: StandardBoldLabel
{
    /** Properties **/
    var likesCount : Int = 0
    
    convenience init(withLikesCount: Int)
    {
        self.init(frame: .zero)
        updateLikesWith(count: withLikesCount)
    }
    
    /** Overrides **/
    override func commonInit()
    {
        super.commonInit()
        self.text = "\(likesCount) likes"
    }
    
    /** Custom methods **/
    func updateLikesWith(count: Int)
    {
        self.likesCount = count
        let plural = count > 1 ? "s" : ""
        
        self.text = "\(count) like\(plural)"
    }
}
