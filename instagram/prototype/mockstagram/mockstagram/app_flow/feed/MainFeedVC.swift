//
//  MainFeedVC.swift
//  mockstagram
//
//  Created by Brad Phillips on 9/24/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit
import Firebase

class MainFeedVC: UIViewController
{
    
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var contentFeed: UIStackView!
    
    var cardsList: [MediaCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        loadPosts()
    }
    
    /** Custom methods **/
    func loadPosts()
    {
        let db = Firestore.firestore()
        db.collection("posts").getDocuments() {
            (querySnapshot, err) in
            if let err = err
            {
                print("Error getting posts: \(err)")
            }
            else if let snapshot = querySnapshot
            {
                for document in snapshot.documents
                {
                    if let post = Post(dictionary: document.data())
                    {
                        let card = MediaCard(withPost: post)
                        self.cardsList.append(card)
                        
                        self.contentFeed.insertArrangedSubview(
                            card, at: self.contentFeed.arrangedSubviews.count
                        )
                    }
                    else
                    {
                        print("Error creating post.")
                    }
                }
            }
        }
    }
}
