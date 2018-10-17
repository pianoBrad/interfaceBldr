//
//  ProfileContactView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/17/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol ProfileContactViewDelegate : class
{
    func callBtnPressed(_ sender: UIButton)
    func emailBtnPressed(_ sender: UIButton)
    func directionsBtnPressed(_ sender: UIButton)
}

class ProfileContactView: StandardStackSubView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var directionsBtn: UIButton!
    
    var contactBtns : [UIButton] = []
    weak var contactDelegate : ProfileContactViewDelegate?
    
    /** Overrides **/
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    /** Custom methods **/
    override func commonInit()
    {
        super.commonInit()
        
        let bundle = Bundle(for: ProfileContactView.self)
        bundle.loadNibNamed(
            String(describing: ProfileContactView.self),
            owner: self, options: nil
        )
        self.containerView.addSubview(contentView)
        contentView.frame = self.containerView.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.setContainerHeight(toValue: 60)
        
        self.contactBtns = [
            callBtn, emailBtn, directionsBtn
        ]
        
        for btn in self.contactBtns
        {
            btn.addTarget(
                self, action: #selector(handleBtnPress), for: .touchUpInside
            )
        }
        
    }
    
    @objc func handleBtnPress(_ sender: UIButton)
    {
        switch sender
        {
        case callBtn:
            contactDelegate?.callBtnPressed(sender)
            break
        case emailBtn:
            contactDelegate?.emailBtnPressed(sender)
            break
        case directionsBtn:
            contactDelegate?.directionsBtnPressed(sender)
            break
        default:
            break
        }
    }
}
