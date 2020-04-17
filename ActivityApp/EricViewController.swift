//
//  EricViewController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/13/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class EricViewController: UIViewController {
  
  @IBOutlet weak var photographerImageView: UIImageView!
  @IBOutlet weak var userImageView: UIImageView!
  
  private lazy var imagePickerController: UIImagePickerController = {
    let mediaType = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
    let pickerController = UIImagePickerController()
    pickerController.mediaTypes = mediaType ?? ["kUTTypeImage"]
    pickerController.delegate = self
    return pickerController
  }()
  
  private var photographerImage: Data?
  private var userImage: Data?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  
  @IBAction func photographerButtonPressed(_ sender: UIButton) {
    imagePickerController.sourceType = .camera
    present(imagePickerController, animated: true)
  }
  
  @IBAction func panoramicButtonPressed(_ sender: UIButton) {
    imagePickerController.sourceType = .photoLibrary
    present(imagePickerController, animated: true)
  }
  
  @IBAction func submitButtonPressed(_ sender: UIButton) {
    let newObject = CoreDataManager.shared.createMediaObject(photographerImage, secondImage: userImage, title: "Strike A Pose, Twice")
    print("object created of type \(newObject.title ?? "no title")")
//    guard let data2 = newObject.image,
//    let data = newObject.video else {
//        return
//    }
//    userImageView.image = UIImage(data: data2)
//    photographerImageView.image = UIImage(data: data)
    
  }
}

extension EricViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if imagePickerController.sourceType == .camera {
      if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
        let imageData = originalImage.jpegData(compressionQuality: 1.0) {
        photographerImageView.image = originalImage
        photographerImage = imageData
        print("photoGrapher image set")
      }
      
    } else if imagePickerController.sourceType == .photoLibrary {
      if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
        let imageData = originalImage.jpegData(compressionQuality: 1.0) {
        userImageView.image = originalImage
        userImage = imageData
        print("userImage image set")
      }
    }
    imagePickerController.dismiss(animated: true)
  }
}

