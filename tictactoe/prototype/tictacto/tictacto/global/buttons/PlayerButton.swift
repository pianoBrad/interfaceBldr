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
			changeButtonState(toState: isActive)
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
	
	func changeButtonState(toState: Bool)
	{
		
		switch toState
		{
		case true:
			self.playerTurnIndicator.backgroundColor = UIColor.init(hexFromString: "#26BCAC")
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
