//
//  Extention+Convertable.swift
//  Summit
//
//  Created by mac on 22/12/22.
//

import Foundation

protocol Convertable: Codable {}

extension Convertable {
    func convertToDict() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any>? = nil
        do {
            print("init student")
            let encoder = JSONEncoder()

            let data = try encoder.encode(self)
            print("struct convert to data")

            dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any>

        } catch {
            print(error)
        }
        return dict
    }
}
