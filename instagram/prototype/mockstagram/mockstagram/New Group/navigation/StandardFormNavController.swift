//
//  StandardFormNavController.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/17/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit


class StandardFormNavController: UINavigationController {

    /** Properties **/
    
    /** Overrides **/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override init(rootViewController: UIViewController)
    {
        super.init(rootViewController: rootViewController)
        commonInit()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /** Custom methods **/
    func commonInit()
    {
        let cancelBtn = UIBarButtonItem(
            title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed)
        )
        self.navigationBar.topItem?.leftBarButtonItem = cancelBtn
    }
    
    @objc func cancelPressed(_ sender : UIBarButtonItem)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
