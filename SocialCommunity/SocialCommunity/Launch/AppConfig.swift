//
//  AppConfig.swift
//  SocialCommunity
//
//  Created by Andres on 2024/6/27.
//

import Foundation
import UIKit

class AppColor: NSObject {
    @objc static let shared: AppColor = {
        let sharedInstance = AppColor()
        return sharedInstance
    }()
    
    // Launch Color
    @objc public let launchColor: UIColor = UIColor(red: 29.0 / 255.0, green: 177.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
    
    // textColor: White
    @objc public let textWhiteColor: UIColor = UIColor.white
    
    // textColor: Brown
    @objc public let textBrownColor: UIColor = UIColor.brown
    
    // borderColor: White
    @objc public let borderWhiteColor: UIColor = UIColor.white
    
    // borderColor: Gray
    @objc public let borderGrayColor: UIColor = UIColor(red: 219.0 / 255.0, green: 219.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0)
    
    // borderColor: LightGray
    @objc public let borderLightGrayColor: UIColor = UIColor(red: 147.0 / 255.0, green: 147.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
    
    // borderColor: Green
    @objc public let GreenColor: UIColor =  UIColor(red: 90.0 / 255.0, green: 185.0 / 255.0, blue: 70.0 / 255.0, alpha: 1.0)
    
    @objc public let itemTitleColor: UIColor = UIColor(red: 100.0 / 255.0, green: 106.0 / 255.0, blue: 115.0 / 255.0, alpha: 1.0)
    
    @objc public let itemTitleSelectedColor: UIColor = UIColor(red: 51.0 / 255.0, green: 112.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    
    @objc public let itemIconColor: UIColor = UIColor(red: 143.0 / 255.0, green: 149.0 / 255.0, blue: 158.0 / 255.0, alpha: 1.0)
    
    @objc public let iconBlue: UIColor = UIColor(red: 72.0 / 255.0 , green: 115.0 / 255.0, blue: 242.0 / 255.0, alpha: 1.0)
}

class AppFont: NSObject {
    @objc static let shared: AppFont = {
        let sharedInstance = AppFont()
        return sharedInstance
    }()
    
    // Latin Thin
    @objc public let font_Latin_Thin: NSString? = "Lato-Thin"
    
    // Latin Bold
    @objc public let font_Latin_Bold: NSString? = "Lato-Bold"
    
    // Inconsolata-ExtraLight
    @objc public let font_Inconsolata_ExtraLight: NSString? = "Inconsolata-ExtraLight"
    
    // Inconsolata-Light
    @objc public let font_Inconsolata_Light: NSString? = "Inconsolata-Light"
    
    // Inconsolata-Regular
    @objc public let font_Inconsolata_Regular: NSString? = "Inconsolata-Regular"
    
}
