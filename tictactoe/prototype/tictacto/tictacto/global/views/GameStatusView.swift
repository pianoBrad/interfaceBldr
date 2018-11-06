//
//  GameStatusView.swift
//  tictacto
//
//  Created by Keithon Stribling on 10/26/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

class GameStatusView: UIView
{

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
//		Waiting for button to say, HEY I've been pressed. The same as, hey the burger is ready for you to grab and do whatever with...
	}
	
}
