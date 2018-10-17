//
//  ProfileHeaderView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/14/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol ProfileHeaderViewDelegate : class
{
    func editProfileBtnPressed(_ sender: UIButton)
}

@IBDesignable
class ProfileHeaderView: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var editProfileBtn: ProfileBtn!
    
    weak var headerDelegate : ProfileHeaderViewDelegate?
    
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
        let bundle = Bundle(for: ProfileHeaderView.self)
        bundle.loadNibNamed(
            String(describing: ProfileHeaderView.self),
            owner: self, options: nil
        )
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
        self.editProfileBtn.addTarget(
            self, action: #selector(checkBtnPress), for: .touchUpInside
        )
    }
    
    @objc func checkBtnPress(_ sender: UIButton)
    {
        switch sender
        {
        case editProfileBtn:
            self.headerDelegate?.editProfileBtnPressed(sender)
            break
        default:
            break
        }
    }
}
