//
//  ProfileHeaderStatsView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/10/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol ProfileHeaderStatsViewDelegate : class
{
    func statWasTapped(_ sender : ProfileHeaderStatsView)
}

@IBDesignable
class ProfileHeaderStatsView: UIView {

    weak var statsDelegate : ProfileHeaderStatsViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var statCountLabel: UILabel!
    @IBOutlet weak var statNameLabel: UILabel!
    
    @IBInspectable var statNameText : String = "statName"
    {
        didSet
        {
            update(text: statNameText, forLabel: statNameLabel)
        }
    }
    @IBInspectable var statCountText : String = "1,234"
    {
        didSet
        {
            update(text: statCountText, forLabel: statCountLabel)
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
        let bundle = Bundle(for: ProfileHeaderStatsView.self)
        bundle.loadNibNamed(
            String(describing: ProfileHeaderStatsView.self),
            owner: self, options: nil
        )
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.checkTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    func update(text: String, forLabel: UILabel)
    {
        forLabel.text = text
    }
    
    @objc func checkTap(_ sender : UITapGestureRecognizer)
    {
        self.statsDelegate?.statWasTapped(self)
    }
}
