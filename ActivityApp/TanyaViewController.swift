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

    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet weak var instructionlabel: UILabel!
    
    private lazy var imagePickerController: UIImagePickerController = {
       let mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
       let pickerController = UIImagePickerController()
       pickerController.mediaTypes = mediaTypes ?? ["kUTTypeImage"]
       pickerController.delegate = self
       return pickerController
     }()
    
    private var mediaObjects = [ActivityModel]() {
        didSet {
          
        }
      }
    
let captureSession = AVCaptureSession()
    var layer: CALayer!
    var captureDevice: AVCaptureDevice!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
             videoButton.isEnabled = false
           }
    }
    
    
    
    func prepareCamera(){
            captureSession.beginConfiguration()
            let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                      for: .video, position: .unspecified)
            guard
                let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
                captureSession.canAddInput(videoDeviceInput)
                else { return }
            captureSession.addInput(videoDeviceInput)
            
        }
    
     private func playVideo(in view: UIView) {
         // we want all non-nil media objects from the
         // mediaObjects array
         // compactMap - because it return all non-nil values
        let videoDataObjects = mediaObjects.compactMap { $0.video }
       
         // get a random video URL
         if let videoObject = videoDataObjects.first,
           let videoURL = videoObject.convertToURL() {
           let player = AVPlayer(url: videoURL)
           
           // create a CALayer
           let playerLayer = AVPlayerLayer(player: player)
           // set its frame
           playerLayer.frame = view.bounds // take up the entire headerView
           // set video aspect ratio
           playerLayer.videoGravity = .resizeAspect
           
           // remove all sublayers from the headerView
           view.layer.sublayers?.removeAll()
           
           // add the playerLayer to the headerView's layer
           view.layer.addSublayer(playerLayer)
           
           // play video
           player.play()
         }
       }
    private func hideStuff(){
         instructionlabel.alpha = 0
        instructionlabel.isHidden = true
        cameraButton.isHidden = true
        resetButton.isHidden = false
        
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        instructionlabel.alpha = 0
        cameraButton.isHidden = true
        videoButton.isHidden = true
        
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true)
        
    }
    
    @IBAction func photoButtonPressed(_ sender: UIButton) {
        hideStuff()
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
        
    }
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
        hideStuff()
        print("Draw")
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
              instructionlabel.alpha = 1
               instructionlabel.isHidden = false
               cameraButton.isHidden = false
               resetButton.isHidden = true
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        hideStuff()
         print("Save")
    }
    
    @IBAction func chooseOtherActivity(_ sender: UIBarButtonItem) {
       UIViewController.showViewController(storyBoardName: "Main", viewControllerId: "TabBarController")
    }
    
}


extension TanyaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
      
      
     guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String else {
            return
          }
          
          switch mediaType { // "public.movie" , "public.image"
          case "public.image":
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
              let imageData = originalImage.jpegData(compressionQuality: 1.0){
              
              // add to Core Data
                let mediaObject = CoreDataManager.shared.createMediaObect(imageData, videoURL: nil, title: "personify")
              
              // add to collection view and reload data
                self.imageView.image = originalImage
                
                //would use this to add imageto main feed of our app
              //mediaObjects.append(mediaObject) // 0 => 1
            }
          case "public.movie":
            if let mediaURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL,
              let image = mediaURL.videoPreviewThumnail(),
              let imageData = image.jpegData(compressionQuality: 1.0){
              print("mediaURL: \(mediaURL)")
              
                let mediaObject = CoreDataManager.shared.createMediaObect(imageData, videoURL: mediaURL, title: "personify")
                self.playVideo(in: imageView)
                
                //would use this to add video to main feed of our app
                // mediaObjects.append(mediaObject)
            }
          default:
            print("unsupported media type")
          }
          
          picker.dismiss(animated: true)
        }
      }



