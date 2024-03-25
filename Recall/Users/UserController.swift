//
//  UserController.swift
//  Recall
//
//  Created by stamoulis nikolaos on 25/3/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserController {
    
    private let userCollection = Firestore.firestore().collection("Users")
    
    func saveUser(user: User, id: String, completion: @escaping (Error?) -> Void) {
        userCollection.document(id).setData(user.asDictionary) { error in
            if let error {
                print(error.localizedDescription)
                completion(error)
            } else {
                completion(nil)
            }
        }
        
    }
}
