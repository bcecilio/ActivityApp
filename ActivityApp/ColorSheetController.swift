//
//  ColorSheetController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ColorSheetController: UIViewController {
    
    @IBOutlet weak var selectedImageView: UIImageView!
    
    let canvas = CanvasColorSheet()
    
    public var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.backgroundColor = UIColor(white: 1, alpha: 0.1)
        canvas.frame = selectedImageView.frame
        selectedImageView.image = selectedImage
    }

    @IBAction func undoButtonPressed(_ sender: UIButton) {
        canvas.undoLine()
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        canvas.clearLine()
    }
    
    @IBAction func saveButtonPresser(_ sender: UIBarButtonItem) {
        let imageData = selectedImage?.jpegData(compressionQuality: 1.0)
        CoreDataManager.shared.createMediaObect(imageData!, videoURL: nil, title: "Colorsheet")
        UIViewController.showViewController(storyBoardName: "Main", viewControllerId: "ViewController")
    }
}
