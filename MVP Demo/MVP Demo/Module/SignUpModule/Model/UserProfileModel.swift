//
//  UserProfileModel.swift
//  MVP Demo
//
//  Created by mac on 17/03/23.
//

import Foundation

struct UserProfileModel {
    let name: String?
    let email: String?
    let id: String?
    
    var dictionary: [String: Any] {
        var dict = [String: Any]()
        if let name = name, let email = email, let id = id  {
            dict = ["name": name, "email": email, "id": id]
        }
        return dict
    }
}
