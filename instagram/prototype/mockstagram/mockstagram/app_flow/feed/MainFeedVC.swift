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
    var cardsList: [MediaCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        cardsList.append(MediaCard())
        cardsList.append(MediaCard())
        
        let feed = self.setupFeed()
        
        for (index, card) in cardsList.enumerated() {
            
            print(index)
            feed.insertArrangedSubview(card, at: index)
        }
    }
    
    func setupFeed() -> UIStackView {
        
        let feedStack = UIStackView(frame: self.contentScrollView.frame)
        feedStack.contentMode = .scaleToFill
        feedStack.axis = .vertical
        feedStack.alignment = .fill
        feedStack.distribution = .equalSpacing
        feedStack.spacing = 10.0
        
        feedStack.translatesAutoresizingMaskIntoConstraints = false
        self.contentScrollView.addSubview(feedStack)
        
        guard let parentView = feedStack.superview else {
            fatalError("Main Feed failed to add to content scroll view.")
        }
        
        feedStack.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        feedStack.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        feedStack.trailingAnchor.constraint(equalTo: parentView.trailingAnchor)

        let botAnchor = NSLayoutConstraint(item: feedStack, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1, constant: 0)
        botAnchor.priority = UILayoutPriority.defaultLow
        parentView.addConstraint(botAnchor)
        
        return feedStack
    }
}
