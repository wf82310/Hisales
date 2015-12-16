//
//  AppDelegate.swift
//  hisales
//
//  Created by 王飞 on 15/11/27.
//  Copyright (c) 2015年 edaysoft.cn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //get current version
        let infoDictionary = NSBundle.mainBundle().infoDictionary
        let currentAppversion = infoDictionary!["CFBundleShortVersionString"] as! String
       // let appDisplayName:AnyObject? = infoDictionary!["CFBundleDisplayName"]
      //  let majorVersion :AnyObject? = infoDictionary! ["CFBundleShortVersionString"]
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let appVersion = userDefaults.stringForKey("appVersion")
        
        let storyboard = UIStoryboard(name: "GuidanceStoryboard", bundle: nil)
        
        // 如果appVersion为nil说明是第一次启动；如果appVersion不等于currentAppVersion说明是更新了
//        if appVersion == nil || appVersion != currentAppversion {
//            
//            userDefaults.setValue(currentAppversion, forKey: "appVersion")
//            
//            var guidanceViewController = storyboard.instantiateViewControllerWithIdentifier("GuidanceVC") as! GuidanceViewController
//            self.window!.rootViewController = guidanceViewController
//        }
        
        
        userDefaults.setValue(currentAppversion, forKey: "appVersion")
        
        let guidanceViewController = storyboard.instantiateViewControllerWithIdentifier("GuidanceVC") as! GuidanceViewController
        self.window!.rootViewController = guidanceViewController

        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

