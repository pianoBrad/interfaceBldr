//
//  MainFeedVC.swift
//  mockstagram
//
//  Created by Brad Phillips on 9/24/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class MainFeedVC: UIViewController {

    
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var contentFeed: UIStackView!
    
    var cardsList: [MediaCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        cardsList.append(MediaCard())
        cardsList.append(MediaCard())
                
        for (index, card) in cardsList.enumerated() {
            
            contentFeed.insertArrangedSubview(card, at: index)
        }
        
        print(contentFeed.frame)
    }
}
