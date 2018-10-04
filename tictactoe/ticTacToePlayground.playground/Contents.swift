import UIKit

/****************** TicTacToeBoardVC Class Start ******************/


class TicTacToeBoardVC : UIViewController {
	
	//**** Properties **** //
	
	var ticTacToeBoardIMG = UIImageView()
	
	override func viewDidLoad() {
		ticTacToeBoardIMG.image
		
//		here is where the delegate would go:
//			func 'gameRestartBtnDelegate()'
	}
	
	
	
}

/****************** TicTacToeBoardVC Class End ******************/


/****************** GameRestartButton Class Start ******************/

// I imagine that this will need a protocol to tell "someone out there" that this button has been pushed. I'm not really sure what way or how to write this protocol but it would make sense to tell the TicTacToeBoardVC to return to initial state... right?


protocol gameRestartBtnDelegate: class {
	// some sort of code block.
	func restartBtnPushed()
	
}

class GameRestartBtn : UIButton {
	
	var bkGrnd : UIColor = .gray
	var textColor: UIColor = .cyan
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = bkGrnd
		self.setTitle("RESTART GAME", for: .normal)
		self.setTitleColor(textColor, for: .normal)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// I imagine that this will need a protocol to tell "someone out there" that this button has been pushed. I'm not really sure what way or how to write this protocol but it would make sense to tell the TicTacToeBoardVC to return to initial state... right?
	
	
	
}
/****************** GameRestartButton Class End ******************/

/****************** GameModeList Class Start ******************/
class GameModeList : UIPickerView {
	
	let gameModeListView = ["Easy", "Medium", "Impossible", "Play against a friend"]
	
	
	
	
}
/****************** GameModeList Class End ******************/

/****************** PlayerCellView Class Start ******************/

class PlayerCellView : UITableViewCell {
	
	
}

// or could it be the next thing???

class PlayerCellViewBtn : UIButton {
	
	var playerCellViewBtn = PlayerCellViewBtn.init(frame: <#T##CGRect#>)
	
//	override init(frame: CGRect) {
//		super.init(frame: playerCellViewBtn)
//	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	
}
/****************** PlayerCellView Class End ******************/
