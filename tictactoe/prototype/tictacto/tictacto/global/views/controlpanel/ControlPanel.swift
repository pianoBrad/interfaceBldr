//
//  ControlPanel.swift
//  tictacto
//
//  Created by Brad Phillips on 10/12/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol ControlPanelDelegate : class
{
    func restartBtnWasPress(_ sender : ControlPanelBtn);
}

@IBDesignable
class ControlPanel: GameSectionView
{
    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var restartBtn: ControlPanelBtn!
    
    var shouldRespond : Bool = true
    var availableHeight : CGFloat = 0
    weak var panelDelegate : ControlPanelDelegate?

    /** Custom Method **/
    override func commonInit()
    {
        self.backgroundColor = UIColor(hexFromString: "#F8F8F8")
        self.availableHeight = self.frame.height
        
        let bundle = Bundle(for: ControlPanel.self)
        bundle.loadNibNamed(
            String(describing: ControlPanel.self), owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
        restartBtn.btnDelegate = self
    }
    
    func pause()
    {
        self.shouldRespond = false
    }
    
    func unPause()
    {
        self.shouldRespond = true
    }
}

extension ControlPanel : ControlPanelBtnDelegate
{
    func controlBtnPressed(_ sender: ControlPanelBtn)
    {
        guard
            shouldRespond
        else
        {
            return
        }
        
        switch sender
        {
        case restartBtn:
            panelDelegate?.restartBtnWasPress(sender)
            break
        default:
            break
        }
    }
}
