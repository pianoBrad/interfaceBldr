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
		
		self.controlPanel = ControlPanel.init(frame: controlPanelFrame)
		self.view.addSubview(controlPanel)
		
	}
	
}










// Present the view controller in the Live View window
PlaygroundPage.current.liveView = TicTacToeVC()

