//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UIColor {
    /**
     * This extension allows us to create an instance of UIColor
     * converted from a hex color, like so:
     *   UIColor(hexFromString: "#ffffff") //would give us white
     */
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var colorString : String = hexFromString.trimmingCharacters(
            in: .whitespacesAndNewlines).uppercased()
        var rgbValue : UInt32 = 10066329 //default to #999999, worst-case
        
        if (colorString.hasPrefix("#")) {
            colorString.remove(at: colorString.startIndex)
        }
        
        if (colorString.count == 6) {
            Scanner(string: colorString).scanHexInt32(&rgbValue)
        }
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255,
                  alpha: alpha)
    }
}

class ControlPanelBtn : UIButton {
	
	/** Properties **/
	var bgColor : UIColor = .clear
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	/** Custom Methods **/
	func commonInit() {
		self.backgroundColor = bgColor
		self.setTitleColor(UIColor.init(hexFromString: "#26BCAC"), for: .normal)
		
	
		
	}
	
	convenience init(frame: CGRect, andColor: UIColor, andText: String) {
		self.init(frame: frame)
		self.backgroundColor = bgColor
		// self.titleLabel?.text = andText
		setTitle(andText, for: .normal)
	}
}

class PlayerView : UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	/** Custom Methods **/
	func commonInit() {
        self.backgroundColor = UIColor(hexFromString: "#F8F8F8")
	}
	
}

class GameBoard : UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	func commonInit() {
		
        self.backgroundColor = UIColor(hexFromString: "#26BCAC")
	}
	
	
}

class ControlPanel : UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	/** Custom Method **/
	func commonInit() {
		self.backgroundColor = UIColor(hexFromString: "#F8F8F8")
	}
	
	
	
	
}



class TicTacToeVC : UIViewController {
	
	/* Properties */
	var playerView : PlayerView!
	var gameBoard : GameBoard!
	var controlPanel : ControlPanel!
	var undoBtn : ControlPanelBtn!
	var resetBtn : ControlPanelBtn!
	var redoBtn : ControlPanelBtn!
	
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
		

        self.view = view
		self.displayPlayerView()
		self.displayGameBoard()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		displayPlayerView()
		displayGameBoard()
		displayControlPanel()
		displayUndoBtn()
		displayResetBtn()
		displayRedoBtn()
	}
	
	/** Custom Methods **/
	func displayPlayerView() {
		
		let playerViewFrame = CGRect.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height/3)
		
		
		
		self.playerView = PlayerView.init(frame: playerViewFrame)
		self.view.addSubview(playerView)

		
		
	}
	
	func displayGameBoard() {
		
		let gameBoardFrame = CGRect.init(x: self.view.frame.origin.x, y: self.playerView.frame.height, width: self.view.frame.width, height: self.view.frame.height/2)
		
		self.gameBoard = GameBoard.init(frame: gameBoardFrame)
		self.view.addSubview(gameBoard)
		
	}
	
	func displayControlPanel() {
		
		/** Properties **/
		let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
		
		let controlPanelFrame = CGRect.init(x: self.view.frame.origin.x, y: self.gameBoard.frame.height + self.playerView.frame.height, width: self.view.frame.width, height: availableHeight)
		
		

		/** Custom Methods **/
		
		self.controlPanel = ControlPanel.init(frame: controlPanelFrame)
		self.view.addSubview(controlPanel)
		
	}
	
	func displayUndoBtn() {
		
		/** Properties **/
		let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
		
		let undoBtnFrame = CGRect.init(x: self.view.frame.origin.x, y: self.controlPanel.frame.origin.y, width: self.controlPanel.frame.width * 0.25, height: availableHeight)
		
		/** Custom Methods **/
//		self.undoBtn = ControlPanelBtn.init(frame: undoBtnFrame)
		self.undoBtn = ControlPanelBtn.init(frame: undoBtnFrame, andColor: .red, andText: "UNDO")
		self.view.addSubview(undoBtn)
		
		
		
	}
	
	func displayResetBtn() {
		
		/** Properties **/
		let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
		
		let resetBtnFrame = CGRect.init(x: self.controlPanel.frame.width * 0.25, y: self.controlPanel.frame.origin.y, width: self.controlPanel.frame.width * 0.50, height: availableHeight)
		
		// I think there is an issue with my x-axis float... I think I set it wrong.
		
		// some sort of property for title.text
		// some sort of property for titleColor.color
		
		/** Custom Methods **/
//		self.resetBtn = ControlPanelBtn.init(frame: resetBtnFrame)
		self.resetBtn = ControlPanelBtn.init(frame: resetBtnFrame, andColor: .yellow, andText: "RESET")
		self.view.addSubview(resetBtn)
		
	}
	
	func displayRedoBtn() {

		/** Properties **/
		let availableHeight =  self.view.frame.height - (self.playerView.frame.height + self.gameBoard.frame.height)
		
		let redoBtnFrame = CGRect.init(x: self.controlPanel.frame.width * 0.75, y: self.controlPanel.frame.origin.y, width: self.controlPanel.frame.width * 0.25, height: availableHeight)

		
		
		// some sort of property for title.text
		// some sort of property for titleColor.color

		/** Custom Methods **/
		
//		self.redoBtn = ControlPanelBtn.init(frame: redoBtnFrame)
		self.redoBtn = ControlPanelBtn.init(frame: redoBtnFrame, andColor: .blue, andText: "REDO")
		self.view.addSubview(redoBtn)

	}
	
}










// Present the view controller in the Live View window
PlaygroundPage.current.liveView = TicTacToeVC()

