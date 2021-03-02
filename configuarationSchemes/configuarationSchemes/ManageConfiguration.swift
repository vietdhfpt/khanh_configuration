//
//  ManageConfiguration.swift
//  configuarationSchemes
//
//  Created by Gia Han on 3/2/21.
//  Copyright © 2021 vn.netstars. All rights reserved.
//

import Foundation

/// Define file info.plist
class InfoPlistKeyConstant {
    static let info = "Info"
    static let plist = "plist"
    static let appName = "CFBundleDisplayName"
    static let bundleIdentifier = "CFBundleIdentifier"
    static let domainAPI = "DOMAIN_API"
    static let appColor = "APP_COLOR"
}

class ManageConfigure: NSObject {
    static var shared: ManageConfigure = ManageConfigure()
    
    var appName: String = ""
    var bundleID: String = ""
    var domainApi: String = ""
    var appColor: String = ""
    
    override init() {
        guard let path = Bundle.main.path(forResource: InfoPlistKeyConstant.info, ofType: InfoPlistKeyConstant.plist) else {
            return
        }
        
        if let config = NSDictionary(contentsOfFile: path) {
            self.appName = (config[InfoPlistKeyConstant.appName] as? String) ?? ""
            self.bundleID = (config[InfoPlistKeyConstant.bundleIdentifier] as? String) ?? ""
            self.domainApi = (config[InfoPlistKeyConstant.domainAPI] as? String) ?? ""
            self.appColor = (config[InfoPlistKeyConstant.appColor] as? String) ?? ""
        }
    }
}
