//
//  CameraViewController.swift
//  ActivityApp
//
//  Created by Tanya Burke on 4/17/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var takenPhoto: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let availableImage = takenPhoto{
            imageView.image = availableImage
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
