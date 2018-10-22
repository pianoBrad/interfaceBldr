//
//  ProfileMenuVC.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/22/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ProfileMenuVC: UIViewController {

    /** Properties **/
    
    /** Overrides **/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        for view in self.view.subviews
        {
            if let menuItemView = view as? HamburgerMenuItemView
            {
                menuItemView.itemDelegate = self
            }
        }
    }
    
    /** Custom methods **/
}

extension ProfileMenuVC : HamburgerMenuItemViewDelegate
{
    func menuItemTapped(_ sender: HamburgerMenuItemView)
    {
        print("take action on menu item now..")
    }
}
