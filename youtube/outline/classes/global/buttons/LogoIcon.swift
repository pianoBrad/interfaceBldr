// This will be our YouTube icon we might place in TopNav or elsewhere
class LogoIcon : Icon {

    override init(frame: CGRect) {
        // Calls init(frame) method of superclass (Icon.swift)
        super.init(frame: frame)
    }

    // This init called if we're loading the view in a storyboard via Interface Builder
    required init?(coder aDecoder: NSCoder) {
        // First, run the super.init(coder) from our Icon.swift file
        super.init(coder: aDecoder)
    }
}