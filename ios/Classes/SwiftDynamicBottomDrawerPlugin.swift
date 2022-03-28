import Flutter
import UIKit

public class SwiftDynamicBottomDrawerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dynamic_bottom_drawer", binaryMessenger: registrar.messenger())
    let instance = SwiftDynamicBottomDrawerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
