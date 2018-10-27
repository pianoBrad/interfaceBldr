//
//  ProfileOptionsTVC.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/27/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ProfileOptionsTVC: UITableViewController {

    /** Properties **/
    
    var sections : [[String : [String]]] = [
        [
            "section" : ["Follow People",],
            "links": ["Contacts",],
        ],
        [
            "section" : ["Account",],
            "links" : [
            "Your Activity", "Password", "Muted Accounts",
            "Payments", "Ad Activity", "Posts You've Liked",
            "Original Photos", "Search History", "Cellular Data Use",
            "Language", "Switch to Business Profile", "Request Verification",
            ],
        ],
        [
            "section" : ["Privacy and Security",],
            "links" : [
            "Accounty Privacy", "Blocked Accounts", "Activity Status",
            "Saved Login Info", "Resharing to Stories", "Story Controls",
            "Comment Controls", "Photos and Videos of You", "Linked Accounts",
            "Account Data", "Two-Factor Authentication", "Data Download",
            "Contacts Syncing", "Pricay and Security Help",
            ],
        ],
        [
            "section" : ["Notifications",],
            "links" : [
                "Push Notifications", "Email and SMS Notifications",
            ],
        ],
        [
            "section" : ["Support",],
            "links" : [
                "Help Center", "Report a Problem",
            ],
        ],
        [
            "section" : ["About",],
            "links" : [
                "Ads", "Data Policy", "Open Source Libraries", "Terms",
            ],
        ],
        [
            "section" : ["Logins",],
            "links" : [
                "Add Account", "Log Out of user_name", "Log Out of All Accounts",
            ],
        ],
    ]
    
    /** Overrides **/
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    override func tableView(
        _ tableView: UITableView, titleForHeaderInSection section: Int
    ) -> String?
    {
        return sections[section]["section"]?.first ?? "Section"
    }

    override func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int
    {
        return sections[section]["links"]?.count ?? 0
    }
    
    override func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell
    {
        let cellTitle = sections[indexPath.section]["links"]?[indexPath.row]
                      ?? "Test"
        var cell : UITableViewCell?
        
        switch indexPath.section
        {
        case 0:
            cell = tableView.dequeueReusableCell(
                withIdentifier: "leftIconDisclosureCell") ?? UITableViewCell()
            cell?.accessoryType = .disclosureIndicator
            break
        case sections.count-1:
            cell = tableView.dequeueReusableCell(
                withIdentifier: "linkCell") ?? UITableViewCell()
            break
        default:
            cell = tableView.dequeueReusableCell(
                withIdentifier: "basicDisclosureCell") ?? UITableViewCell()
            cell?.accessoryType = .disclosureIndicator
        }
        
        cell?.textLabel?.text = cellTitle
        return cell ?? UITableViewCell()
    }
    
    /** Custom methods **/
}
