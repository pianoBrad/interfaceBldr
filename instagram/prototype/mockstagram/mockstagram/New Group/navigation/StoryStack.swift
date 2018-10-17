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
class StoryStack: StandardStackSubView
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

    convenience init(withDemoStories: Int)
    {
        self.init(frame: .zero)
        commonInit(withDemoStories: withDemoStories)
    }
    
    /** Custom methods **/
    func commonInit(withDemoStories : Int = 0)
    {
        super.commonInit()
        let bundle = Bundle(for: StoryStack.self)
        bundle.loadNibNamed(
            String(describing: StoryStack.self),
            owner: self, options: nil
        )
        self.containerView.addSubview(contentView)
        contentView.frame = self.containerView.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.setContainerHeight(toValue: 85)
        
        displayDemoStories(amountToShow: withDemoStories)
    }
    
    func displayDemoStories(amountToShow: Int)
    {
        clearStories()
        
        for _ in stride(from: 1, through: amountToShow, by: 1)
        {
            let storyBtn = StoryBtnView()
            stories.append(storyBtn)
            mainStackView.insertArrangedSubview(storyBtn, at: mainStackView.arrangedSubviews.count)
            storyBtn.storyBtnDelegate = self
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
