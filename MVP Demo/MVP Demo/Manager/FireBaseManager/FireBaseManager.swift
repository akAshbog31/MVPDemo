//
//  FireBaseManager.swift
//  MvvmDemoFireBase
//
//  Created by mac on 03/11/22.
//

import Foundation
import Firebase
import FirebaseFirestore

var userDefaultId = "userDefaultId"

class FirebaseManager {
    
    static var shared = FirebaseManager()
    var db = Firestore.firestore()
    
    func saveUserDefaultId(id: String) {
        UserDefaults.standard.set(id, forKey: userDefaultId)
    }
    
    func createUser(email: String, password: String, complition: @escaping ((Result<UserProfileModel,Error>)->())) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            
            if let uid = result?.user.uid {
                self.saveUserDefaultId(id: uid)
            }
            
            complition(.success(UserProfileModel(name: result?.user.displayName, email: result?.user.email, id: result?.user.uid)))
        }
    }
    
    func addUser(model: UserProfileModel, userId: String, complition: @escaping ((Result<Void,Error>)->())) {
        db.collection("Users").document(userId).setData(model.dictionary) { error in
            if let err = error {
                complition(.failure(err))
                return
            }
            
            complition(.success(()))
        }
    }
    
    func signIn(email: String, password: String, complition: @escaping ((Result<Void,Error>)->())) {
        Auth.auth().signIn(withEmail: email, password: password) { authresult, error in
            if let err = error {
                complition(.failure(err))
                return
            }
            
            complition(.success(()))
        }
    }
}

