//
//  User.swift
//  Recall
//
//  Created by stamoulis nikolaos on 25/3/24.
//

import Foundation


struct User {
    let username: String
    let email: String
    
    
    init(username: String, email: String) {
        self.username = username
        self.email = email
    }
    
    var asDictionary: [String: Any] {
        return [
            "username": username,
            "email": email,
            
        ]
    }
}
