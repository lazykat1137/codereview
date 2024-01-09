//
//  Configs.swift
//  Lazy Kat
//
//  Created by Viral on 07/09/18.
//  Copyright © 2018 Lazy Kat. All rights reserved.
//


import Foundation
import UIKit

// IMPORTANT: APP NAME
let APP_NAME = "Lazy Kat"
let APP_ID = "1413146875"
let APP_VERSION : String = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
let APP_BUILD : String = (Bundle.main.infoDictionary?["CFBundleVersion"] as? String)! // e.g. 1.1.0
let DEVICE_TYPE = "iOS"
let DEVICE_MODEL = UIDevice.current.model // e.g. iPhone 5
let SYSTEM_VERSION = UIDevice.current.systemVersion // The current version of the operating system. e.g. 9.0

// IMPORTANT: ORANGE THEME COLOR
let THEME_COLOR = UIColor(red: 23.0/255.0, green: 19.0/255.0, blue: 51.0/255.0, alpha: 1.0)
let ACCENT_COLOR = UIColor(red: 243.0/255.0, green: 21.0/255.0, blue: 65.0/255.0, alpha: 1.0)
let TABLE_BACKGROUND_COLOR = UIColor(red: 236.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)

// IMPORTANT: EMAIL ADDRESS WITH THE ONE, THE USERS WHO WILL REPORT INAPPROPRIATE VIDEOS
let REPORT_EMAIL_ADDRESS = "viraltailor113@gmail.com"
let FEEDBACK_EMAIL_ADDRESS = "viraltailor113@gmail.com"

//ALL CONSTANTS

let FONT_NAME = "Poppins-Regular"
let FONT_MEDIUM_NAME = "Poppins-Medium"
let FONT_SEMIBOLD_NAME = "Poppins-SemiBold"
let FONT_BOLD_NAME = "Poppins-Bold"
let FONT_LIGHT_NAME = "Poppins-Light"

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}

extension UIViewController
{
    func showAlert(titleStr:String, messageStr : String)
    {
        let alert = UIAlertController(title: titleStr,
                                      message: messageStr,
                                      preferredStyle: .alert)
        
        let YesAction = UIAlertAction(title: "OK",
                                      style: .default)
        { (action: UIAlertAction!) -> Void in
            
        }
        alert.addAction(YesAction)
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    func showWhisperAlert(messageStr : String, messageType : GSMessageType )
    {
        self.showMessage(messageStr, type: messageType, options: [
            .animation(.slide),
            .animationDuration(0.3),
            .autoHide(true),
            .autoHideDelay(3.0),
            .cornerRadius(0.0),
            .height(35.0),
            .hideOnTap(true),
            .margin(.zero),
            .padding(.init(top: 10, left: 30, bottom: 10, right: 30)),
            .position(.top),
            .textAlignment(.center),
            .textColor(.white),
            .textNumberOfLines(1),
            ])
    }
}


















