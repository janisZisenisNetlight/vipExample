import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let owner = AccountOwner(firstName: "Janis", familyName: "Zisenis")
        let account = Account(id: "1234", owner: owner)
        
        let coordinator = AccountCoordinator(navigationController: navigationController, account: account)
        coordinator.start()

        return true
    }
}
