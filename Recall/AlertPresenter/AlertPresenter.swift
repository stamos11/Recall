//
//  AlertPresenter.swift
//  Recall
//
//  Created by stamoulis nikolaos on 1/4/24.
//

import UIKit

class AlertPresenter {
    
    private init() {}
    
    static func showAlert(title: String, message: String, style: UIAlertController.Style, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { action in
            alert.addAction(action)
        }
        Router.shared.navigationController.present(alert, animated: true)
    }
}
