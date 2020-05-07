//
//  FlutterChannelManager.swift
//  Runner
//
//  Created by Vilashraj Patel on 07/05/20.
//

import Foundation
class FlutterChannelManager{
    let channel: FlutterMethodChannel
    let viewFactory: FluffViewFactory
    unowned let flutterViewController: FlutterViewController
    init(flutterViewController: FlutterViewController, viewFactory: FluffViewFactory) {
        self.viewFactory = viewFactory
        self.flutterViewController = flutterViewController
        channel = FlutterMethodChannel(name: "com.example.platformView", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
            }
    
    func setup(rootViewController:UIViewController) {
        channel.setMethodCallHandler { (call, result) in
            
            switch call.method {
            case "changeColor":
                self.viewFactory.fluffView.changeColor()
                result(true)
                break;
            default:
                break
            }
        }
    }
}

