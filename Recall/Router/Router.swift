//
//  Router.swift
//  Recall
//
//  Created by stamoulis nikolaos on 1/4/24.
//

import UIKit


class Router {
    
    private init() {}
    static let shared = Router()
    
    let navigationController = UINavigationController()
    
    
    func dismiss() {
        navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func push(viewController: UIViewController) {
         
        navigationController.pushViewController(viewController, animated: true)
    }
    func start() {
        navigationController.pushViewController(WelcomeController(), animated: true)
        
    }
    
    
}
