import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if let app_name = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            UIView.setFullContext([
                "app_name": app_name
            ])
        }

        enterStoryboard(name: "LaunchScreen")

        perform(#selector(fadeOutLaunchScreen), with: nil, afterDelay: 0.4)

        return true
    }

    // codestep-7A806A89-162F-44C6-8472-54A7627F0825 Application Open URL
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {

        AppSchemeData.shared.update(url: url)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    // ----------------------------------------------------------------------

    func enterStoryboard(name: String, bundle: Bundle? = nil) {
        let newWindow = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        let initialViewController = storyboard.instantiateInitialViewController()
        newWindow.rootViewController = initialViewController
        newWindow.makeKeyAndVisible()
        DispatchQueue.onMain(after: 200) {
            self.window = newWindow
        }
    }

    @objc
    func fadeOutLaunchScreen() {
        UIViewController.prepareFadeScreen()
        enterStoryboard(name: "Main")
    }

}
