// Could/should we start this class as a sublcass of UIButton?
class Icon : UIView {

    // This init called if we're creating the icon from scratch in some other swift Class file
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // This init called if we're loading the view in a storyboard via Interface Builder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}