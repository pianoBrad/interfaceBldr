//
//  ProfileContactView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileContactView: UIView
{
    /** Properties **/
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var callBtn: ProfileContactBtn!
    @IBOutlet weak var emailBtn: ProfileContactBtn!
    
    @IBOutlet weak var directionsBtn: ProfileContactBtn!
    
    
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
        let bundle = Bundle(for: ProfileContactView.self)
        bundle.loadNibNamed(
            String(describing: ProfileContactView.self),
            owner: self, options: nil
        )
    
        self.addSubview(contentView)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
