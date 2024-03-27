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
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = navigationController
//        window?.rootViewController = MainController()
        return true
    }

}

