import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var flutterChannelManager: FlutterChannelManager!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
     /*
      
      Platform View Setup
      
      */
     
    let viewFactory = FluffViewFactory()
     registrar(forPlugin: "Kitty").register(viewFactory, withId: "FluffView")
     
    
    /*
     
     Method Channel Setup
     
     */
    
    // Getting root view controller
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
    // Initializing the flutter channel manager.
    flutterChannelManager = FlutterChannelManager(flutterViewController: controller, viewFactory: viewFactory)
    
    // Setting up the method channel handler
    flutterChannelManager.setup(rootViewController: self.window.rootViewController!)
    
    
    
 
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
