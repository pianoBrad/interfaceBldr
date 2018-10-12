//
//  StoryStack.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

@IBDesignable
class StoryStack: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBInspectable var numDemoStories : Int = 1
    {
        didSet
        {
            if (numDemoStories > 0)
            {
                self.displayDemoStories(amountToShow: numDemoStories)
            }
        }
    }
    var stories : [StoryBtnView] = []
    
    /** Overrides **/
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        self.displayDemoStories(amountToShow: numDemoStories)
    }

    /** Custom methods **/
    func commonInit()
    {
        let bundle = Bundle(for: StoryStack.self)
        bundle.loadNibNamed("StoryStack", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.bounds = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        displayDemoStories(amountToShow: 10)
    }
    
    func displayDemoStories(amountToShow: Int)
    {
        clearStories()
        
        for _ in 1...amountToShow
        {
            let storyBtnFrame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
            print(storyBtnFrame)
            let storyBtn = StoryBtnView(frame: storyBtnFrame)
            stories.append(storyBtn)
        }
        
        for (index, card) in stories.enumerated()
        {
            mainStackView.insertArrangedSubview(card, at: index)
        }
    }
    
    func clearStories()
    {
        self.stories = []
    
        for view in mainStackView.subviews
        {
            print("removing views now..")
            mainStackView.removeArrangedSubview(
                view, shouldRemoveFromSuperview: true
            )
        }
    }
}
