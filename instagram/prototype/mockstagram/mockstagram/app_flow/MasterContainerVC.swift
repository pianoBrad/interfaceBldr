//
//  MasterContainerVC.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/21/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class MasterContainerVC: UIViewController
{
    /** Properties **/
    @IBOutlet weak var tabControllerContainer: UIView!
    @IBOutlet weak var profileHamburgerContainer: UIView!
    @IBOutlet weak var tabControllerLeadingConst: NSLayoutConstraint!
    @IBOutlet weak var profileHamburgerWidthConst: NSLayoutConstraint!
    @IBOutlet weak var touchListenerView: UIView!
    
    var profileMenuIsOpen : Bool = false
    var mainTabBar : MainTabBC?
    
    /** Overrides **/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        touchListenerView.isUserInteractionEnabled = false
        let gesture = UITapGestureRecognizer(
            target: self, action: #selector(openProfileMenu))
        touchListenerView.addGestureRecognizer(gesture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? MainTabBC
        {
            mainTabBar = destination
            mainTabBar?.tabDelegate = self
        }
        else if let destination = segue.destination as? ProfileMenuVC
        {
            destination.itemDelegate = self
        }
    }
    
    /** Custom methods **/
    @objc func openProfileMenu()
    {
        var leadingConstant : CGFloat = 0
        
        switch profileMenuIsOpen
        {
        case true:
            leadingConstant = 0
            profileMenuIsOpen = false
            break
        default:
            leadingConstant = -profileHamburgerWidthConst.constant
            profileMenuIsOpen = true
            break
        }
        
        self.touchListenerView.isUserInteractionEnabled = profileMenuIsOpen
        self.tabControllerLeadingConst.constant = leadingConstant
        
        UIView.animate(
            withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            },
            completion:
            {
                (value: Bool) in
            }
        )
    }
}

extension MasterContainerVC : MainTabBCDelegate
{
    func profileRightNavItemTapped(_ sender: UIBarButtonItem)
    {
        self.openProfileMenu()
    }
}

extension MasterContainerVC : ProfileMenuVCDelegate
{
    func menuItemTapped(_ sender: HamburgerMenuItemView)
    {
        self.openProfileMenu()
        mainTabBar?.handleProfileMenuItemPress(sender)
    }
}
