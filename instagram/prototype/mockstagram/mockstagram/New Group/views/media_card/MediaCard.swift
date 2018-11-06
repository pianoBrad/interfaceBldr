//
//  MediaCard.swift
//  mockstagram
//
//  Created by Brad Phillips on 9/24/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit
import Kingfisher

class MediaCard: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    
    // Header props
    @IBOutlet var headerContainerView: UIView!
    @IBOutlet var headerLabelContainer: UIView!
    @IBOutlet var subtitleHeightConst: NSLayoutConstraint!
    @IBOutlet var headerUserNameLabel: UILabel!
    @IBOutlet var headerSubtitleLabel: UILabel!
    @IBOutlet var postImage: UIImageView!
    
    // Footer props
    @IBOutlet var footerContainerView: UIView!
    @IBOutlet var likeFooterIcon: MediaCardFooterIcon!
    @IBOutlet var addToCollectionIcon: MediaCardFooterIcon!
    
    
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
    
    func commonInit()
    {
        let bundle = Bundle(for: MediaCard.self)
        bundle.loadNibNamed(
            String(describing: MediaCard.self),
            owner: self, options: nil
        )
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        setupHeaderComponents()
        setupFooterComponents()
    }
    
    convenience init(withPost: Post)
    {
        let avatarImageUrl = URL(string: withPost.avatarUrl)
        let postImageUrl = URL(string: withPost.mediaUrl)
        
        self.init(frame: .zero)
        
        self.headerUserNameLabel.text = withPost.author
        self.postImage.contentMode = .scaleAspectFill
        self.postImage.kf.setImage(with: postImageUrl)
        self.profileImageView.kf.setImage(with: avatarImageUrl)
    }
    
    /** Custom methods **/
    func setupHeaderComponents()
    {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = theme.borderBtnLightGrey.cgColor
    }
    
    func setupFooterComponents()
    {
        for subview in footerContainerView.subviews
        {
            if let icon = subview as? MediaCardFooterIcon
            {
                icon.iconDelegate = self
            }
        }
    }
}

extension MediaCard : MediaCardFooterIconDelegate
{
    func iconTapped(_ sender: MediaCardFooterIcon)
    {
        switch sender
        {
        case addToCollectionIcon:
            print("add to collection tapped!")
            break
        default:
            // defaulting to heart icon
            print("like tapped!")
            break
        }
    }
}
