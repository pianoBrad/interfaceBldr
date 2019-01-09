//
//  exampleVC.swift
//  tableOrScroll
//
//  Created by Brad Phillips on 1/8/19.
//  Copyright © 2019 megaBreezy. All rights reserved.
//

import UIKit

class ExampleVC: UIViewController
{
    /** Properties **/
    @IBOutlet var mainContainerView: UIView!
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var mainScrollContentView: UIView!
    @IBOutlet var testLabel: UILabel!
    
    /** Overrides **/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print("mainContainerViewHeight: \(mainContainerView.frame.height)")
        print("mainScrollViewHeight: \(mainScrollView.frame.height)")
        print("mainScrollContentViewHeight: \(mainScrollContentView.frame.height)")
        print("testLabelHeight: \(testLabel.frame.height)")
    }
}
