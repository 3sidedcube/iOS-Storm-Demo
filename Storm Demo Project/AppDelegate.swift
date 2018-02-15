//
//  AppDelegate.swift
//  Storm Demo Project
//
//  Created by Matthew Cheetham on 15/02/2018.
//  Copyright © 2018 threesidedcube. All rights reserved.
//

import ThunderCloud

@UIApplicationMain
class AppDelegate: TSCAppDelegate {
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]?) -> Bool {
        
        StormObjectFactory.shared.override(class: ListPage.self, with: DemoListPage.self)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
