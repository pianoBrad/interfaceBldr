//
//  ProfileStatsView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol ProfileStatsViewDelegate : class
{
    func statWasTapped(_ sender: ProfileStatsView)
}

@IBDesignable
class ProfileStatsView: UIView
{
    weak var statsDelegate : ProfileStatsViewDelegate?
    
    var statNameLabel : UILabel!
    var statLabelHeight : CGFloat = 15
    var statNameFontSize : CGFloat = 12
    var statNameFont : UIFont?
    
    var statCountLabel : UILabel!
    var statCountLabelHeight : CGFloat = 21
    var statCountFontSize : CGFloat = 17
    var statCountFont : UIFont?
    
    @IBInspectable var statNameText : String = "stat" {
        didSet {
            statNameLabel.text = statNameText
        }
    }
    @IBInspectable var statCountText : String = "1,000" {
        didSet {
            statCountLabel.text = statCountText
        }
    }
    
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

    override func prepareForInterfaceBuilder()
    {
        setupLabels()
    }
    
    /** Custom methods **/
    func commonInit()
    {
        setupLabels()
        let gesture = UITapGestureRecognizer(
            target: self, action: #selector(self.checkAction)
        )
        self.addGestureRecognizer(gesture)
    }
    
    func setupLabels()
    {
        statNameFont = UIFont(
            name: theme.fontNamePrimaryRegular,
            size: statNameFontSize
        )
        statCountFont = UIFont(
            name: theme.fontNamePrimaryBold,
            size: statCountFontSize
        )
        
        statNameLabel = createLabel(
            withText: statNameText, andColor: theme.lightGrey,
            andFont: statNameFont
        )
        statCountLabel = createLabel(
            withText: statCountText, andColor: theme.darkGrey,
            andFont: statCountFont
        )
        
        place(
            view: statNameLabel, withHeight: statLabelHeight
        )
        place(
            view: statCountLabel, withHeight: statCountLabelHeight,
            aboveView: statNameLabel
        )
    }
    
    func createLabel(withText: String, andColor: UIColor,
                     andFont: UIFont?)->UILabel
    {
        let label = UILabel(frame: .zero)
        
        label.textAlignment = .center
        label.textColor = andColor
        label.text = withText
        
        if let labelFont = andFont as UIFont?
        {
            label.font = labelFont
        }
        
        return label
    }
    
    func place(view: UIView, withHeight: CGFloat,
               aboveView: UIView? = nil)
    {
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConst = NSLayoutConstraint(
            item: view, attribute: .leading, relatedBy: .equal,
            toItem: self, attribute: .leading,
            multiplier: 1, constant: 0
        )
        let trailingConst = NSLayoutConstraint(
            item: view, attribute: .trailing, relatedBy: .equal,
            toItem: self, attribute: .trailing,
            multiplier: 1, constant: 0
        )
        let heightConst = NSLayoutConstraint(
            item: view, attribute: .height, relatedBy: .equal,
            toItem: nil, attribute: .notAnAttribute,
            multiplier: 1, constant: withHeight
        )
        var botConst = NSLayoutConstraint(
            item: view, attribute: .bottom, relatedBy: .equal,
            toItem: self, attribute: .bottom,
            multiplier: 1, constant: 0
        )
        
        if let bottomView = aboveView as UIView?
        {
            botConst = NSLayoutConstraint(
                item: view, attribute: .bottom, relatedBy: .equal,
                toItem: bottomView, attribute: .top,
                multiplier: 1, constant: 0
            )
        }
        
        self.addConstraints(
            [leadingConst, botConst, trailingConst, heightConst]
        )
    }
    
    /** Actions **/
    @objc func checkAction(_ sender: UITapGestureRecognizer)
    {
        statsDelegate?.statWasTapped(self)
    }
}
