//
//  AppDelegate.swift
//  QTFloatingDrawer
//
//  Created by BhumaJ on 11/13/2017.
//  Copyright (c) 2017 BhumaJ. All rights reserved.
//

import UIKit
import QTFloatingDrawer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    
    let kQTDrawersStoryboardName = "Main"
    
    let kQTDrawerSettingsViewControllerStoryboardId = "QTDrawerSettingsViewControllerStoryboardId"
    let kQTDrawerWebViewViewControllerStoryboardId = "QTDrawerWebViewControllerStoryboardId"
    let kQTLeftDrawerStoryboardId = "QTLeftDrawerViewControllerStoryboardId"
    let kQTRightDrawerStoryboardId = "QTRightDrawerViewControllerStoryboardId"
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = drawerViewController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private var _drawerViewController: QTDrawerViewController?
    var drawerViewController: QTDrawerViewController {
        get {
            if let viewController = _drawerViewController {
                return viewController
            }
            return prepareDrawerViewController()
        }
    }
    
    func prepareDrawerViewController() -> QTDrawerViewController {
        let drawerViewController = QTDrawerViewController()
        
        drawerViewController.centerViewController = drawerSettingsViewController()
        drawerViewController.leftViewController = leftViewController()
        drawerViewController.rightViewController = rightViewController()
//        drawerViewController.backgroundImage = UIImage(named: "sky3")
        _drawerViewController = drawerViewController
        
        return drawerViewController
    }
    
    private func drawerStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: kQTDrawersStoryboardName, bundle: nil)
        return storyboard
    }
    
    private func viewControllerForStoryboardId(storyboardId: String) -> UIViewController {
        let viewController: UIViewController = drawerStoryboard().instantiateViewController(withIdentifier: storyboardId)
        return viewController
    }
    
    func drawerSettingsViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(storyboardId: kQTDrawerSettingsViewControllerStoryboardId)
        return viewController
    }
    
    func sourcePageViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(storyboardId: kQTDrawerWebViewViewControllerStoryboardId)
        return viewController
    }

    private func leftViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(storyboardId: kQTLeftDrawerStoryboardId)
        return viewController
    }
    
    private func rightViewController() -> UIViewController {
        let viewController = viewControllerForStoryboardId(storyboardId: kQTRightDrawerStoryboardId)
        return viewController
    }
    
    func toggleLeftDrawer(sender:AnyObject, animated:Bool) {
        _drawerViewController?.toggleDrawer(.left, animated: true, complete: { (finished) -> Void in
            // do nothing
        })
    }
    
    func toggleRightDrawer(sender:AnyObject, animated:Bool) {
        _drawerViewController?.toggleDrawer(.right, animated: true, complete: { (finished) -> Void in
            
        })
    }
    
    private var _centerViewController: UIViewController?
    var centerViewController: UIViewController {
        get {
            if let viewController = _centerViewController {
                return viewController
            }
            return drawerSettingsViewController()
        }
        set {
            if let drawerViewController = _drawerViewController {
                drawerViewController.closeDrawer(drawerViewController.currentlyOpenedSide, animated: true) { finished in }
                if drawerViewController.centerViewController != newValue {
                    drawerViewController.centerViewController = newValue
                }
            }
            _centerViewController = newValue
        }
    }

}

