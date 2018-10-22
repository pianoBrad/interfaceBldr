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
    
    var profileMenuIsOpen : Bool = false
    
    /** Overrides **/
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? MainTabBC
        {
            destination.tabDelegate = self
        }
    }
    
    /** Custom methods **/
    func openProfileMenu()
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
