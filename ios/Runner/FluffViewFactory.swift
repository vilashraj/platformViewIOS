//
//  FluffViewFactory.swift
//  Runner
//
//  Created by Vilashraj Patel on 07/05/20.
//

import Foundation

public class FluffViewFactory:NSObject, FlutterPlatformViewFactory{
    
    var fluffView: FluffView = FluffView(CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0),viewId: 0,args: "")
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        fluffView = FluffView(frame,viewId: viewId, args: args)
        return fluffView
    }
    
    
}


public class FluffView: NSObject, FlutterPlatformView{
    
    let frame:CGRect
    let viewId: Int64
    var containView: UIView = UIView()
    var bgColor: UIColor = UIColor.blue
    
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.containView = UIView(
        frame: frame
        )
    }
    public func view() -> UIView {
        containView.backgroundColor = self.bgColor
        return containView
    }
    
    public func changeColor(){
        self.bgColor = .random()
    }
    
    
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
