//
//  AppDelegate.swift
//  Recall
//
//  Created by stamoulis nikolaos on 20/3/24.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
//        window?.rootViewController = Router.shared.navigationController
//        Router.shared.start()
        window?.rootViewController = LevelsController()
        return true
    }

}

