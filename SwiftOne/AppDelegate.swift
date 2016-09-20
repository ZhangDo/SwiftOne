//
//  AppDelegate.swift
//  SwiftOne
//
//  Created by chenmengjia on 16/8/8.
//  Copyright © 2016年 MuLeZhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.frame = UIScreen.mainScreen().bounds
        
        window?.rootViewController = self.setTabBar()
        
        window?.makeKeyAndVisible()
        
        
        return true
    }
    //设置TabBar
    func setTabBar() -> UITabBarController {
        let RootTabBarController = UITabBarController()
        //首页
        let homeVC = HomeViewController()
        let homeNavigationVC = UINavigationController.init(rootViewController: homeVC)
        let homeTabBar = UITabBarItem.init(title: "首页", image: UIImage.init(named: "tabbar_item_home"), selectedImage: UIImage.init(named: "tabbar_item_home_selected"))
        homeNavigationVC.tabBarItem = homeTabBar
        
        
        //文章
        let readVC = ReadViewController()
        let ReadNavigationVC = UINavigationController.init(rootViewController: readVC)
        let readTabBar = UITabBarItem.init(title: "文章", image: UIImage.init(named: "tabbar_item_reading"), selectedImage: UIImage.init(named: "tabbar_item_reading_selected"))
        ReadNavigationVC.tabBarItem = readTabBar
        
        //问题
        let questionVC = QuestionViewController()
        let QuestionNavigationVC = UINavigationController.init(rootViewController: questionVC)
        let questionTabBar = UITabBarItem.init(title: "问题", image: UIImage.init(named: "tabbar_item_question"), selectedImage: UIImage.init(named: "tabbar_item_question_selected"))
        QuestionNavigationVC.tabBarItem = questionTabBar
        
        
        //东西
        let thingsVC = ThingsViewController()
        let ThingsNavigationVC = UINavigationController.init(rootViewController: thingsVC)
        let thingstabBar = UITabBarItem.init(title: "东西", image: UIImage.init(named: "tabbar_item_thing"), selectedImage: UIImage.init(named: "tabbar_item_thing_selected"))
        ThingsNavigationVC.tabBarItem = thingstabBar
        
        
        //个人
        let profileVC = ProfileViewController()
        let ProfilenavigationVC = UINavigationController.init(rootViewController: profileVC)
        let profileTabBar = UITabBarItem.init(title: "个人", image: UIImage.init(named: "tabbar_item_person"), selectedImage: UIImage.init(named: "tabbar_item_person_selected"))
        ProfilenavigationVC.tabBarItem = profileTabBar
        
        RootTabBarController.viewControllers = [homeNavigationVC,ReadNavigationVC,QuestionNavigationVC,ThingsNavigationVC,ProfilenavigationVC]
        
        return RootTabBarController
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

