//
//  AppDelegate.swift
//  Gradients
//
//  Created by hc_cyril on 2017/3/10.
//  Copyright © 2017年 Clark. All rights reserved.
//

import UIKit
import Spots

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        ListSpot.configure = { tableView in
            tableView.backgroundColor = UIColor.clear
            tableView.tableFooterView = UIView(frame: CGRect.zero)
            tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            tableView.separatorColor = Color.cellSeparator
        }
        
        ListSpot.register(defaultView: GradientsListCell.self)
        let controller = ViewController(title: "😍")
        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        applyStyles()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: private method
    fileprivate func applyStyles() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color.navigationBarForeground, NSFontAttributeName: Font.navigationBar]
        navigationBar.tintColor = Color.navigationBarForeground
        navigationBar.barTintColor = UIColor(red: 0.333, green: 0.220, blue: 0.478, alpha: 1)
        navigationBar.shadowImage = UIImage()
    }


}

