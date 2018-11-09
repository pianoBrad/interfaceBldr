//
//  ThemeGlobals.swift
//  mockstagram
//
//  Created by Brad Phillips on 10/9/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ThemeGlobals: NSObject
{
    /** Colors **/
    var darkGrey = UIColor(hexFromString: "#262626")
    var lightGrey = UIColor(hexFromString: "#999999")
    var borderBtnLightGrey = UIColor(hexFromString: "#CCCCCC")
    var linkPrimary = UIColor(hexFromString: "#3897F0")
    var bgColorPrimary = UIColor(hexFromString: "#FFFFFF")
    
    /** Fonts **/
    var fontNamePrimaryHairline = "Lato-Hairline"
    var fontNamePrimaryHairlineItalic = "Lato-HairlineItalic"
    var fontNamePrimaryLight = "Lato-Light"
    var fontNamePrimaryLightItalic = "Lato-LightItalic"
    var fontNamePrimaryRegular = "Lato-Regular"
    var fontNamePrimaryRegularItalic = "Lato-Italic"
    var fontNamePrimaryBold = "Lato-Bold"
    var fontNamePrimaryBoldItalic = "Lato-BoldItalic"
    var fontNamePrimaryBlack = "Lato-Black"
    var fontNamePrimaryBlackItalic = "Lato-BlackItalic"
    
    /** Spacing **/
    var primaryStackSpacingX : CGFloat = 10
    var primaryStackSpacingY : CGFloat = 8
    var primaryCardComponentSpacingX : CGFloat = 15
    
    override init()
    {
    }
}

let theme = ThemeGlobals()
