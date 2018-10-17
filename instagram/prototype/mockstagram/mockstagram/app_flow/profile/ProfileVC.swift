//
//  ProfileVC.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileVC: UIViewController {

    /** Properties **/
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var contentStack: UIStackView!

    var headerView : ProfileHeaderView?
    var occupationView : ProfileOccupationView?
    var bioView : DynamicHeightLabel?
    var followersView : ProfileFollowersListView?
    
    var bio : String = "Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio! Tester bio!"
    var followers : [String] = ["myFriend", "someDude", "anotherHomie"]
    
    /** Overrides **/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        addProfileHeader()
        addOccupation(titled: "test occupation")
        addBio(withText: bio)
        
        addFollowers(withList:followers)
        contentStack.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        var contentWidth = contentStack.frame.width
        
        if self.view.safeAreaLayoutGuide.layoutFrame.size.width < contentWidth
        {
            contentWidth = self.view.safeAreaLayoutGuide.layoutFrame.size.width
        }
        
        self.bioView?.resetLabelHeight(forWidth: contentWidth)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (context) in
            // During rotation
            self.bioView?.resetLabelHeight(forWidth: self.contentStack.frame.width)
        }) { (context) in
            // After rotation
        }
    }
    
    /** Custom methods **/
    func addProfileHeader()
    {
        headerView = ProfileHeaderView()
        contentStack.insertArrangedSubview(headerView!, at: 0)
    }
    
    func addOccupation(titled: String)
    {
        occupationView = ProfileOccupationView(withTitle: titled)
        if let headerLocation = contentStack.findArrangedSubview(
            ofClass: ProfileHeaderView.self)
        {
            contentStack.insertArrangedSubview(
                occupationView!, at: headerLocation+1
            )
        }
        else
        {
            contentStack.insertArrangedSubview(occupationView!, at: 0)
        }
    }
    
    func addBio(withText: String)
    {
        bioView = DynamicHeightLabel(withText: withText)
        if let occupationLocation = contentStack.findArrangedSubview(
            ofClass: ProfileOccupationView.self)
        {
            contentStack.insertArrangedSubview(
                bioView!, at: occupationLocation+1
            )
        }
        else if let headerLocation = contentStack.findArrangedSubview(
            ofClass: ProfileHeaderView.self)
        {
            contentStack.insertArrangedSubview(
                bioView!, at: headerLocation+1
            )
        }
        else
        {
            contentStack.insertArrangedSubview(bioView!, at: 0)
        }
    }
    
    func addFollowers(withList: [String])
    {
        followersView = ProfileFollowersListView(withFollowers: withList)
        contentStack.insertArrangedSubview(followersView!, at: contentStack.arrangedSubviews.count)
    }
}
