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
    
    @objc public let textColor: UIColor = UIColor.white
}
