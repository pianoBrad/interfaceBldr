
class MainTabVC : UIViewController {

    /** Properties **/

    var topNav : TopNav
    var contentView : ContentView
    var botNav : BottomNav

    // This method of superclass UIViewController called when the view is loaded into memory on the device & ready to display on screen
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up listeners for the properties we want to receive notifications/events from
    }
}

/** Delegates/Extensions/Listeners **/

extension MainTabVC : TopNavDelegate {

    func accountBtnTapped(_ sender : Icon) {
        // Respond to the event that fires when a user taps the account icon

        // We'd probably load up & present the account view here, yah?
    }

    // What other delegate functions might we have in this extension?
}