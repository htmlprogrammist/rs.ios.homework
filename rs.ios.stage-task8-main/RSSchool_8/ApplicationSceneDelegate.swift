//
//  ApplicationSceneDelegate.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      05.07.2021
//

import UIKit

// 😈
class ApplicationSceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        window?.rootViewController = NavigationController(rootViewController: ArtistViewController())
        window?.makeKeyAndVisible()
    }
}

