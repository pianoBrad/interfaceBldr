//
//  PostDescriptionLabel.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class PostDescriptionLabel: UILabel
{
    /** Properties **/
    var authorName : String = ""
    var comment : String = ""
    var mainFeedScrollView : UIScrollView?
    
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
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(handleTap(_:))
        )
        self.addGestureRecognizer(tapGesture)
    }
    
    func set(authorName: String, andComment: String)
    {
        self.authorName = authorName
        self.comment = andComment
        
        let attributedText = NSMutableAttributedString()
        attributedText
            .bold(self.authorName, 14.0)
            .normal(" \(self.comment)")
        self.attributedText = attributedText
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        if  let scrollView = self.mainFeedScrollView,
            self.numberOfLines > 0
        {
            self.numberOfLines = 0
            UIView.animate(
                withDuration: 0.3, animations:
                {
                    scrollView.layoutIfNeeded()
                    self.superview?.layoutIfNeeded()
                }
            )
        }
    }
}
