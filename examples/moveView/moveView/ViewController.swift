//
//  ViewController.swift
//  moveView
//
//  Created by Brad Phillips on 1/25/19.
//  Copyright © 2019 megaBreezy. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    /** Properties **/
    
    @IBOutlet var slideTriggerBtn: UIButton!
    @IBOutlet var sliderView: UIView!
    @IBOutlet var sliderViewBotConst: NSLayoutConstraint!
    @IBOutlet var sliderViewHeightConst: NSLayoutConstraint!
    

    var offset : CGFloat = 100
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.offset = -self.sliderViewHeightConst.constant
        self.sliderViewBotConst.constant = offset
    }
    
    /** Actions **/
    
    @IBAction func triggerTouched(_ sender: Any)
    {
        offset = offset < 0
            ? 0
            : -self.sliderViewHeightConst.constant
        
        self.sliderViewBotConst.constant = offset
        UIView.animate(withDuration: 1, animations:
        {
            self.view.layoutIfNeeded()
        },
        completion:
        {
            (value: Bool) in
            print("shifted")
        })
    }
    
}

