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
    var profileTab : ProfileVC?
    
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
                    profileTab = profileVC
                    profileTab?.profileDelegate = self
                }
            }
        }
    }
    
    /** Custom methods **/
    func handleProfileMenuItemPress(_ sender : HamburgerMenuItemView)
    {
        switch sender.segueID
        {
        case segue.profileSettingsSegueID:
            profileTab?.performSegue(
                withIdentifier: segue.profileSettingsSegueID, sender: profileTab)
        default:
            break
        }
    }
}

extension MainTabBC : ProfileVCDelegate
{
    func hamburgerItemPressed(_ sender: UIBarButtonItem)
    {
        tabDelegate?.profileRightNavItemTapped(sender)
    }
}
