//
//  FPSMonitor.swift
//  FPSMonitor
//
//  Created by WG on 2018/3/23.
//  Copyright © 2018年 WG. All rights reserved.
//

import UIKit

public class FPSMonitor: NSObject {
    public static func show(){
        `default`.show()
    }
    public static func hide(){
        `default`.hide()
    }
    
    fileprivate var label = UILabel(frame: CGRect(x: 2, y: 22, width: 80, height: 20))
    fileprivate var disp: CADisplayLink?
    fileprivate var timeStamp = Double(0)
    fileprivate var frames = 0
    fileprivate static let `default` = FPSMonitor()
    
    @objc fileprivate func refresh(_ disp: CADisplayLink){
        let now = CFAbsoluteTimeGetCurrent()
        if now - timeStamp > 0.2{
            let val = Double(disp.frameInterval * frames) / (now - timeStamp)
            label.text = "FPS:\(Int(val))"
            if val >= 45{
                label.textColor = .green
            }else if val >= 30{
                label.textColor = .orange
            }else{
                label.textColor = .red
            }
            timeStamp = now
            frames = 0;
        }else{
            frames += 1
        }
        print(CFAbsoluteTimeGetCurrent())
    }
    fileprivate func show(){
        if let _ = label.superview {
            label.superview?.bringSubview(toFront: label)
            label.backgroundColor = .clear
        }else{
            UIApplication.shared.keyWindow?.addSubview(label)
        }
        if disp == nil{
            disp = CADisplayLink(target: self, selector: #selector(refresh(_:)))
            disp?.add(to: .main, forMode: .commonModes)
        }
    }
    fileprivate func hide(){
        disp?.invalidate()
        disp = nil
        label.removeFromSuperview()
    }
}

