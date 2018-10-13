//
//  StoryStack.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol StoryStackDelegate : class
{
    func storyTapped(_ sender: StoryBtnView)
}

@IBDesignable
class StoryStack: UIView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!

    var stories : [StoryBtnView] = []
    
    weak var stackDelegate : StoryStackDelegate?
    
    /** Overrides **/
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit(withDemoStories: 5)
    }

    /** Custom methods **/
    func commonInit(withDemoStories : Int = 0)
    {
        let bundle = Bundle(for: StoryStack.self)
        bundle.loadNibNamed(
            String(describing: StoryStack.self),
            owner: self, options: nil
        )
        self.addSubview(contentView)
        contentView.bounds = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        displayDemoStories(amountToShow: withDemoStories)
    }
    
    func displayDemoStories(amountToShow: Int)
    {
        clearStories()
        
        //for _ in 1...amountToShow
        for _ in stride(from: 1, through: amountToShow, by: 1)
        {
            let storyBtnFrame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
            let storyBtn = StoryBtnView(frame: storyBtnFrame)
            stories.append(storyBtn)
        }
        
        for (index, story) in stories.enumerated()
        {
            mainStackView.insertArrangedSubview(story, at: index)
            story.storyBtnDelegate = self
        }
    }
    
    func clearStories()
    {
        self.stories = []
    
        for view in mainStackView.subviews
        {
            mainStackView.removeArrangedSubview(
                view, shouldRemoveFromSuperview: true
            )
        }
    }
}

extension StoryStack : StoryBtnViewDelegate
{
    func storyTapped(_ sender: StoryBtnView)
    {
        stackDelegate?.storyTapped(sender)
    }
}
