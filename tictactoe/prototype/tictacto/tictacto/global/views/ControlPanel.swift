//
//  ControlPanel.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class ControlPanel: UIView {

    /* Properties */
    var undoBtn : ControlPanelBtn!
    var resetBtn : ControlPanelBtn!
    var redoBtn : ControlPanelBtn!
    
    var availableHeight : CGFloat = 0
    
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
    
    /** Custom Method **/
    func commonInit()
    {
        self.backgroundColor = UIColor(hexFromString: "#F8F8F8")
        self.availableHeight = self.frame.height
        
        displayRedoBtn()
        displayUndoBtn()
        displayResetBtn()
    }
    
    /** Custom Methods **/
    func displayUndoBtn()
    {
        /** Properties **/
        let undoBtnFrame = CGRect.init(x: self.frame.origin.x, y: 0, width: self.frame.width * 0.25, height: availableHeight)

        print(undoBtnFrame)
        
        /** Custom Methods **/
        self.undoBtn = ControlPanelBtn.init(frame: undoBtnFrame, andColor: .red, andText: "UNDO")
        self.addSubview(undoBtn)
    }
    
    func displayResetBtn()
    {
        /** Properties **/
        let resetBtnFrame = CGRect.init(x: self.frame.width * 0.25, y: 0, width: self.frame.width * 0.50, height: availableHeight)
        
        self.resetBtn = ControlPanelBtn.init(frame: resetBtnFrame, andColor: .yellow, andText: "RESET")
        self.addSubview(resetBtn)
    }
    
    func displayRedoBtn()
    {
        /** Properties **/
        let redoBtnFrame = CGRect.init(x: self.frame.width * 0.75, y: 0, width: self.frame.width * 0.25, height: availableHeight)
        
        self.redoBtn = ControlPanelBtn.init(frame: redoBtnFrame, andColor: .blue, andText: "REDO")
        self.addSubview(redoBtn)
    }
}
