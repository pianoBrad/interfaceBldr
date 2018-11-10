//
//  PostDescriptionLabel.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol PostDescriptionLabelDelegate : class
{
    func expandedDescriptionWasTapped(_ sender : PostDescriptionLabel);
}

class PostDescriptionLabel: UILabel
{
    /** Properties **/
    var authorName : String = ""
    var comment : String = ""
    var truncatedComment : NSMutableAttributedString = NSMutableAttributedString()
    var fullComment : NSMutableAttributedString = NSMutableAttributedString()
    var mainFeedScrollView : UIScrollView?
    var moreEllipsis = "..."
    var moreText = " more  "
    var moreString = "... more  "
    var wasTruncated : Bool = false
    var descriptionDelegate : PostDescriptionLabelDelegate?
    
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
        self.fullComment = attributedText
        
        var truncatedText : String = getTruncatingText(
            originalString: "\(authorName) \(andComment)",
            newEllipsis: moreString, maxLines: 2
        )
        self.wasTruncated = !(truncatedText == "\(authorName) \(andComment)")
        truncatedText = truncatedText.replacingFirstOccurrence(
            of: authorName, with: ""
        )
        truncatedText = truncatedText.replacingOccurrences(of: moreString, with: "")
        
        self.truncatedComment = truncatedComment.bold(self.authorName, 14.0)
        self.truncatedComment = truncatedComment.normal("\(truncatedText)")
        if self.wasTruncated
        {
            self.truncatedComment = truncatedComment.normal(moreEllipsis)
            self.truncatedComment = truncatedComment.colored(moreText, theme.lightGrey)
        }
        
        self.attributedText = truncatedComment
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        if  self.wasTruncated,
            let scrollView = self.mainFeedScrollView,
            self.numberOfLines > 0
        {
            self.attributedText = self.fullComment
            self.numberOfLines = 0
            UIView.animate(
                withDuration: 0.3, animations:
                {
                    scrollView.layoutIfNeeded()
                }
            )
        }
        else
        {
            descriptionDelegate?.expandedDescriptionWasTapped(self)
        }
    }
}
