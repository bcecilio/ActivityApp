//
//  UIController+Navigation.swift
//  ActivityApp
//
//  Created by Tanya Burke on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

extension UIViewController {
  
  private static func resetWindow(with rootViewController: UIViewController) {
    guard let scene = UIApplication.shared.connectedScenes.first,
      let sceneDelegate = scene.delegate as? SceneDelegate,
      let window = sceneDelegate.window else {
        fatalError("could not reset window rootViewController")
    }
    window.rootViewController = rootViewController
  }
  
  public static func showViewController(storyBoardName: String, viewControllerId: String) {
    let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
    let newVC = storyboard.instantiateViewController(identifier: viewControllerId)
    resetWindow(with: newVC)
  }
  


    public func showAlert(title: String?, message: String?){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
