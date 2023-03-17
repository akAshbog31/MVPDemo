//
//  Utils.swift
//  MVP Demo
//
//  Created by mac on 17/03/23.
//

import Foundation
import UIKit

final class Utils {
    static var shared = Utils()
    private init() {}
    
    func getSceneDelegate() -> SceneDelegate? {
        guard let delegate = UIApplication.shared.connectedScenes.first else { return nil }
        return delegate.delegate as? SceneDelegate ?? nil
    }
}

