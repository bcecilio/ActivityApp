//
//  TanyaViewController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/13/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//
import AVFoundation
import AVKit
import UIKit

class TanyaViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    private lazy var imagePickerController: UIImagePickerController = {
       let mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
       let pickerController = UIImagePickerController()
       pickerController.mediaTypes = mediaTypes ?? ["kUTTypeImage"]
       pickerController.delegate = self
       return pickerController
     }()
    
    private var mediaObjects = [ActivityModel]() {
        didSet { // property observer
          
        }
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    captureSession.beginConfiguration()
//    let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
//                                              for: .video, position: .unspecified)
//    guard
//        let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
//        captureSession.canAddInput(videoDeviceInput)
//        else { return }
//    captureSession.addInput(videoDeviceInput)
    
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func startOverButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    
}


extension TanyaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
      // info dictionary keys
      // InfoKey.originalImage - UIImage
      // InfoKey.mediaType - String
      // Infokey.mediaURL - URL
      
      guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String else {
        return
      }
      
      switch mediaType { // "public.movie" , "public.image"
      case "public.image":
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
          let imageData = originalImage.jpegData(compressionQuality: 1.0){
//          let mediaObject = CDMediaObject(imageData: imageData, videoURL: nil, caption: nil)
            let mediaObject = CoreDataManager.shared.createMediaObect(imageData, videoURL: nil)
          mediaObjects.append(mediaObject) // 0 => 1
        }
      case "public.movie":
        if let mediaURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL , let image = mediaURL.videoPreviewThumnail(), let imageData = image.jpegData(compressionQuality: 1.0){
          print("mediaURL: \(mediaURL)")
      //    let mediaObject = CDMediaObject(imageData: nil, videoURL: mediaURL, caption: nil)
            
            let mediaObject = CoreDataManager.shared.createMediaObect(imageData, videoURL: mediaURL)
          mediaObjects.append(mediaObject)
        }
      default:
        print("unsupported media type")
      }
      
      picker.dismiss(animated: true)
    }
  }


