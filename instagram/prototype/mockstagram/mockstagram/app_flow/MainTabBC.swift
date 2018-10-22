//
//  MainTabBC.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/21/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol MainTabBCDelegate: class
{
    func profileRightNavItemTapped(_ sender : UIBarButtonItem)
}

class MainTabBC: UITabBarController
{
    /** Properties **/
    weak var tabDelegate : MainTabBCDelegate?
    
    /** Overrides **/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let vcs = self.viewControllers
        {
            for vc in vcs
            {
                if let profileNav = vc as? UINavigationController,
                   let profileVC = profileNav.viewControllers.first as? ProfileVC
                {
                    profileVC.profileDelegate = self
                }
            }
        }
    }
    
    /** Custom methods **/
}

extension MainTabBC : ProfileVCDelegate
{
    func hamburgerItemPressed(_ sender: UIBarButtonItem)
    {
        tabDelegate?.profileRightNavItemTapped(sender)
    }
}
