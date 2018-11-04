//
//  MediaCard.swift
//  mockstagram
//
//  Created by Brad Phillips on 9/24/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit
import Kingfisher

class MediaCard: UIView {

    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var headerLabelContainer: UIView!
    @IBOutlet var subtitleHeightConst: NSLayoutConstraint!
    @IBOutlet var headerUserNameLabel: UILabel!
    @IBOutlet var headerSubtitleLabel: UILabel!
    @IBOutlet var postImage: UIImageView!
    
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
    }
    
    convenience init(withPost: Post)
    {
        self.init(frame: .zero)
        self.headerUserNameLabel.text = withPost.author
        
        let postImageUrl = URL(string: withPost.mediaUrl)
        self.postImage.contentMode = .scaleAspectFill
        self.postImage.kf.setImage(with: postImageUrl)
    }
    
    /** Custom methods **/
}
