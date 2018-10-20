//
//  StandardSliderView.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/19/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class StandardSliderView: UIView
{
    /** Properties **/
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var slidesPager: UIPageControl!
    @IBOutlet weak var slidesScrollView: UIScrollView!
    @IBOutlet weak var slidesStack: UIStackView!
    @IBOutlet weak var slideStackWidth: NSLayoutConstraint!
    
    var slideViews : [UIView] = []
    var previousPageXOffset: CGFloat = 0.0
    
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
    
    /** Custom methods **/
    func commonInit()
    {
        let bundle = Bundle(for: StandardSliderView.self)
        bundle.loadNibNamed(
            String(describing: StandardSliderView.self), owner: self, options: nil)
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.slidesScrollView.delegate = self
    }
    
    func setupSlides() -> Bool
    {
        if self.slideViews.count > 0
        {
            self.slidesPager.numberOfPages = slideViews.count
            slideStackWidth = slideStackWidth.setMultiplier(multiplier: CGFloat(slideViews.count))
            for slide in slideViews
            {
                self.slidesStack.insertArrangedSubview(
                    slide, at: slidesStack.arrangedSubviews.count)
            }
            
            return true
        }
        
        return false
    }
}

extension StandardSliderView : UIScrollViewDelegate
{
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        scrollView.isUserInteractionEnabled = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.isUserInteractionEnabled = true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let targetOffset = targetContentOffset.pointee
        
        if targetOffset.x == previousPageXOffset {
            // page will not change
        } else if targetOffset.x < previousPageXOffset {
            // scroll view will page left
            changePage(isNext: false)
            
        } else if targetOffset.x > previousPageXOffset {
            // scroll view will page right
            changePage()
        }
        
        previousPageXOffset = targetOffset.x
    }
    
    func changePage(isNext: Bool = true)
    {
        switch isNext
        {
        case true:
            self.slidesPager.currentPage += 1
            break
        default:
            self.slidesPager.currentPage -= 1
        }
    }
}
