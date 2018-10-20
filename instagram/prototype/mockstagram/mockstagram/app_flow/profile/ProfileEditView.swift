//
//  ProfileEditView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/17/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ProfileEditView: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var bizToolsBtn: StandardFormSectionBtn!
    
    var curNav : UINavigationController?
    
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
    
    convenience init(withNav: UINavigationController)
    {
        self.init(frame: .zero)
        self.curNav = withNav
    }
    
    /** Custom methods **/
    func commonInit()
    {
        let bundle = Bundle(for: ProfileEditView.self)
        bundle.loadNibNamed(
            String(describing: ProfileEditView.self), owner: self, options: nil
        )
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.bizToolsBtn.btnDelegate = self
        
        loadForm()
    }
    
    func loadForm()
    {
    }
}

extension ProfileEditView : StandardFormSectionBtnDelegate
{
    func btnPressed(_ sender: StandardFormSectionBtn)
    {
        switch sender
        {
        case bizToolsBtn:
            let vc = UIViewController()
            vc.view = BizToolsSlider()
            vc.title = "Try Mockstagram Biz Tools!"
            self.curNav?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}
