//
//  PlayerButton.swift
//  tictacto
//
//  Created by Keithon Stribling on 10/23/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

protocol PlayerButtonDelegate : class
{
	func buttonTapped(_ sender: PlayerButton)
}

@IBDesignable
class PlayerButton: UIView
{

	/** Properties **/
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var playerTurnIndicator: UIView!
	@IBOutlet weak var playerNameLabel: UILabel!
	@IBOutlet weak var playerScoreLabel: UILabel!
	
	weak var buttonDelegate: PlayerButtonDelegate?
	
	@IBInspectable var isActive: Bool = false
	{
		didSet
		{
			changeButtonState(setActive: isActive, shouldUpdateSelf: nil)
		}
	}
	
	
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
	
	
	/** Custom Methods **/
	func commonInit()
	{
		let bundle = Bundle(for: PlayerButton.self)
		bundle.loadNibNamed(String(describing: PlayerButton.self), owner: self, options: nil)
		
		self.addSubview(contentView)
		contentView.frame = self.bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		let gesture = UITapGestureRecognizer(target: self, action: #selector(checkTap))
		self.addGestureRecognizer(gesture)
	}
	
    func changeButtonState(setActive: Bool? = nil, shouldUpdateSelf : Bool? = true)
	{
        // update our isActive property to be opposite of itself,
        // unless storyboard rendering (this avoids an error in Interface Builder)
        if (shouldUpdateSelf != nil)
        {
            self.isActive = setActive != nil
                ? setActive!
                : !self.isActive
        }
    
        // set active state to check against,
        // using the new isActive property, unless we pass an explicit parameter
        // into this method (setActive), then we use that
        let activeState = setActive != nil
            ? setActive
            : self.isActive
        
        // Update button to reflect new state
		switch activeState
		{
		case true:
			self.playerTurnIndicator.backgroundColor = UIColor.init(
                hexFromString: "#26BCAC"
            )
			break
		default:
			self.playerTurnIndicator.backgroundColor = .clear
			break
		}
	}
	
	@objc func checkTap(_ sender: UITapGestureRecognizer)
	{
		buttonDelegate?.buttonTapped(self)
	}
	

}
