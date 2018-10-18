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
    var cancelBtn : UIBarButtonItem!
    var doneBtn : UIBarButtonItem!
    
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
        cancelBtn = UIBarButtonItem(
            title: "Cancel", style: .plain, target: self, action: #selector(barBtnPressed)
        )
        
        doneBtn = UIBarButtonItem(
            title: "Done", style: .plain, target: self, action: #selector(barBtnPressed)
        )
        
        self.navigationBar.topItem?.leftBarButtonItem = cancelBtn
        self.navigationBar.topItem?.rightBarButtonItem = doneBtn
    }
    
    @objc func barBtnPressed(_ sender : UIBarButtonItem)
    {
        switch sender
        {
        case cancelBtn:
            self.dismiss(animated: true, completion: nil)
            break
        case doneBtn:
            self.dismiss(animated: true, completion: nil)
            break
        default:
            break
        }
    }
}
