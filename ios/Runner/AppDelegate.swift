import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      GMSServices.provideAPIKey("AIzaSyAEDjuhnjffdsW-OnGg2MvdD31M8IQZf7A")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
