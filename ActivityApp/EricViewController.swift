//
//  EricViewController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/13/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class EricViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var mediaObjects = [ActivityModel]()
    
    private func fetchMediaObjects() {
      mediaObjects = CoreDataManager.shared.fetchMediaObjects()
    }
    func updateUI(){
        if let data = mediaObjects[0].image {image.image = UIImage(data: data)}
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}
