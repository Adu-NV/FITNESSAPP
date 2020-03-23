//
//  AppDelegate.swift
//  Fitness-App
//
//  Created by Netventure on 14/02/20.
//  Copyright © 2020 freelancer. All rights reserved.
//

import UIKit
import AMTabView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigatinController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.launcherPage()
        // Customize the colors
        AMTabView.settings.ballColor = #colorLiteral(red: 0.7489047647, green: 0.9445528984, blue: 0.7091112733, alpha: 1)
        AMTabView.settings.tabColor = #colorLiteral(red: 1, green: 0.6082915664, blue: 0.5277339816, alpha: 1)
        AMTabView.settings.selectedTabTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        AMTabView.settings.unSelectedTabTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        // Chnage the animation duration
        AMTabView.settings.animationDuration = 1

        return true
    }
    
    func launcherPage(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeView =  storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        self.window?.rootViewController = homeView
        if #available(iOS 13.0, *) {
            UIApplication.shared.statusBarStyle = .lightContent
           navigatinController = UINavigationController(rootViewController: homeView)
            navigatinController.isNavigationBarHidden = true
            self.window?.rootViewController = navigatinController
            self.window?.makeKeyAndVisible()
        }else{
            self.window?.rootViewController = homeView
        }
    }
    

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

