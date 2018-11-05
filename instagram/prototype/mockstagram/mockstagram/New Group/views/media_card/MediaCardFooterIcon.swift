//
//  MediaCardFooterIcon.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/5/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol MediaCardFooterIconDelegate : class
{
    func iconTapped(_ sender : MediaCardFooterIcon)
}

@IBDesignable
class MediaCardFooterIcon: UIView
{
    /** Properties **/
    @IBInspectable var iconImage : UIImage?
    {
        didSet
        {
            if let image = iconImage
            {
                setIconImageWith(image: image)
            }
        }
    }
    weak var iconDelegate : MediaCardFooterIconDelegate?
    
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
        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(handleTap)
        )
        self.addGestureRecognizer(tapGesture)
    }
    
    func setIconImageWith(image: UIImage)
    {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewConstraints = getFullSizeViewConstraints(
            toView: imageView, forView: self
        )
        self.addConstraints(imageViewConstraints)
    }
    
    @objc func handleTap(_ sender : MediaCardFooterIcon)
    {
        iconDelegate?.iconTapped(self)
    }
}
