//
//  SceneDelegate.swift
//  MVP Demo
//
//  Created by mac on 17/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController?.navigationController?.isNavigationBarHidden = true
        window?.rootViewController = UINavigationController(rootViewController: LogInVc.instantiate())
        window?.makeKeyAndVisible()
    }
}

