//
//  ProfileBtn.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/11/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol ProfileBtnDelegate : class
{
    func btnWasPressed(_ sender : UIButton)
}

@IBDesignable
class ProfileBtn: UIButton
{
    weak var btnDelegate : ProfileBtnDelegate?
    
    @IBInspectable
    var borderRadius : CGFloat = 5
    {
        didSet
        {
            self.setBorder(withRadius: borderRadius)
        }
    }
    
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
        self.layer.borderColor = theme.borderBtnLightGrey.cgColor
        self.layer.borderWidth = 1
        self.setTitleColor(theme.darkGrey, for: .normal)
        
        self.setBorder(withRadius: self.borderRadius)
        self.layer.masksToBounds = true

        self.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
    }
    
    func setBorder(withRadius: CGFloat)
    {
        self.layer.cornerRadius = withRadius
    }
    
    /** Actions **/
    @objc func checkAction(_ : UITapGestureRecognizer)
    {
        btnDelegate?.btnWasPressed(self)
    }
}
