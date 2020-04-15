//
//  UIViewController+Navigation.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/15/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private static func resetWindow(_ rootViewController: UIViewController) {
        guard let scene = UIApplication.shared.connectedScenes.first, let sceneDelegate = scene.delegate as? SceneDelegate, let window = sceneDelegate.window else {
            fatalError("could not reset window to rootVC")
        }
        window.rootViewController = rootViewController
    }
    
    public static func showViewController(storyboardName: String, viewControllerId: String) {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let newVC = storyboard.instantiateViewController(identifier: viewControllerId)
        resetWindow(newVC)
    }
}
