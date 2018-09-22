
/**
 * Define main class TopNav, which inherits from superclass UIView
 **/

class TopNav : UIView {

    /** Properties **/

    var logoIcon : LogoIcon
    var actionIconList : [ActionIcon]

    // This init called if we're creating the view from scratch in some other swift Class file
    override init(frame: CGRect) {

        // Call super init method to run any code inside of the UIView superclass's init definition
        super.init(frame: frame)

        // Set this TopNav instance to be the delegate listener of every icon we have in our property list
        self.logoIcon.delegate = self

        // this block loops through the actionIconList property and does the delegate declaration on each one
        for icon in actionIconList {
            icon.delegate = self
        }
    }

    // This init called if we're loading the view in a storyboard via Interface Builder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

/** Delegates/Extensions/Listeners **/

// Extend top class to listen for taps from objects of type Icon
// We do this, so we can respond to any buttons displaying inside of this view
extension TopNav : IconDelegate {

    func iconTapped(_ sender: Icon) {

        // Find out what button was tapped

        // Do something if button is logoIcon

        // If not logoIcon, do loop through the other Icon class properties in actionIconList
            // if this button in the list was the tapped button, do something
    }
}