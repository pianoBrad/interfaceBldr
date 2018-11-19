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
class ControlPanel: UIView {

    /** Properties **/
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var restartBtn: ControlPanelBtn!
	
	
    var availableHeight : CGFloat = 0
    weak var panelDelegate : ControlPanelDelegate?
    
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
        
        let bundle = Bundle(for: ControlPanel.self)
        bundle.loadNibNamed(
            String(describing: ControlPanel.self), owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
        restartBtn.btnDelegate = self
    }
}

extension ControlPanel : ControlPanelBtnDelegate
{
    func controlBtnPressed(_ sender: ControlPanelBtn)
    {
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
