//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class HelloLabel : UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.text = "Hello, world."
		self.textColor = .red
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
}

class GoodbyeLabel : UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.textAlignment = NSTextAlignment.center
		self.numberOfLines = 2
		self.text = "Love, Peace, and Hairgrease! \n🖤✌🏾💁🏾‍♂️"
		self.textColor = .black
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

//        let label = HelloLabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 200)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
		
		let hello = HelloLabel(frame: CGRect(x: 150, y: 200, width: 200, height: 20))
		let goodbye = GoodbyeLabel(frame: CGRect(x: 0, y: 300, width: 400, height: 50))

		
		view.addSubview(hello)
		view.addSubview(goodbye)
		
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


// homework: create label for "goodbye" underneath "hello, world"
