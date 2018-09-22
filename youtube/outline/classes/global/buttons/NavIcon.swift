// This will be the class for each instance of the righthand icons in TopNav
class NavIcon: Icon {

    override init(frame: CGRect) {
        // Calls init(frame) method of superclass (Icon.swift)
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        // Calls init(coder) method of superclass (Icon.swift)
        super.init(coder: aDecoder)
    }
}