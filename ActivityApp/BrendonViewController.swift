//
//  BrendonViewController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/13/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class BrendonViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var libraryButton: UIBarButtonItem!
    @IBOutlet weak var colorButton: UIButton!

    private var image: UIImage? {
        didSet {
            imageView.image = createGrayScale(image: image!)
        }
    }
    
    private lazy var imagePickerController: UIImagePickerController = {
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.mediaTypes = mediaTypes ?? ["kUTTypeImage"]
        return pickerController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.cameraButton.isEnabled = false
        }
    }
    
    private func createGrayScale(image: UIImage) -> UIImage {
        // create image rectangle with current image width/height
        let imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        // grayscale color space
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = image.size.width
        let height = image.size.height
        // create bitmap content with current image size and grascale colorspace
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        // draw image into current context, with specified rectangle using previously defined context with grayscale colorspace.
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(image.cgImage!, in: imageRect)
        let imageRef = context!.makeImage()
        // create a new UIImage object
        let newImage = UIImage(cgImage: imageRef!)
        return newImage
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func libraryButtonPresser(_ sender: UIBarButtonItem) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true)
    }
}

extension BrendonViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String else {
                return
            }
            
            switch mediaType {
            case "public.image":
                if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    let imageData = originalImage.jpegData(compressionQuality: 1.0)
                    image = UIImage(data: imageData!)
                }
            default:
                print("went to default")
            }
            imagePickerController.dismiss(animated: true)
        }
}
