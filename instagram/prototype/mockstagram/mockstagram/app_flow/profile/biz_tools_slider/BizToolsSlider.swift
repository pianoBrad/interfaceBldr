//
//  BizToolsSlider.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/20/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class BizToolsSlider: StandardSliderView
{
    /** Properties **/
    
    /** Overrides **/
    override func commonInit()
    {
        super.commonInit()
        self.slideViews = [
            BizToolsSlideOne(), BizToolsSlideTwo()
        ]
        
        if (!self.setupSlides())
        {
            print("slides could not be loaded")
        }
    }
    
    /** Custom methods **/
}
