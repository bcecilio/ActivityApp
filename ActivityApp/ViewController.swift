//
//  ViewController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/13/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emojifyButton: UIButton!
    @IBOutlet weak var strikePoseButton: UIButton!
    @IBOutlet weak var personifyButton: UIButton!
    @IBOutlet weak var colorSheetButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    private func configureButtons() {
         emojifyButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        emojifyButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        emojifyButton.layer.shadowOpacity = 1.0
        emojifyButton.layer.shadowRadius = 0.0
        emojifyButton.layer.masksToBounds = false
        emojifyButton.layer.cornerRadius = 4.0
        
        strikePoseButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        strikePoseButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        strikePoseButton.layer.shadowOpacity = 1.0
        strikePoseButton.layer.shadowRadius = 0.0
        strikePoseButton.layer.masksToBounds = false
        strikePoseButton.layer.cornerRadius = 4.0
        
        personifyButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        personifyButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        personifyButton.layer.shadowOpacity = 1.0
        personifyButton.layer.shadowRadius = 0.0
        personifyButton.layer.masksToBounds = false
        personifyButton.layer.cornerRadius = 4.0
        
        colorSheetButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        colorSheetButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        colorSheetButton.layer.shadowOpacity = 1.0
        colorSheetButton.layer.shadowRadius = 0.0
        colorSheetButton.layer.masksToBounds = false
        colorSheetButton.layer.cornerRadius = 4.0
    }
    
//    private var testActivities = [Activity]() {
//        didSet {
//          testLabel.text = testActivities[1].title
//        }
//      }
//      private var db = DatabaseService()
//      private func dbServiceTest() {
//        db.loadActivities { (result) in
//          switch result {
//          case .failure(let error):
//            print("Error loading titles: \(error)")
//          case .success(let activities):
//            self.testActivities = activities
//            print("activities loaded")
//          }
//        }
//      }
//
    private func navigateToTanyaView() {
        UIViewController.showViewController(storyBoardName:  "TanyaStoryboard", viewControllerId: "TanyaViewController")
    
    }
    

    private func navigateToColorSheet() {
        UINavigationController.showViewController(storyBoardName: "ColorSheet", viewControllerId: "MainNavController")
    }

    private func navigateToJaheedView() {
        UIViewController.showViewController(storyBoardName:  "Jaheed", viewControllerId: "navigationController")
    

    }
    
    @IBAction func emojifyButtonPressed(_ sender: UIButton) {
//        guard let jaheedVC = UIViewController(nibName: nil, bundle: nil) as? JaheedViewController else{fatalError("failed to segue")}
//        UINavigationController.pushViewController(jaheedVC)
        navigateToJaheedView()
    }
    @IBAction func strikeButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func personifyButtonPresser(_ sender: UIButton) {
        
        navigateToTanyaView()
        print("Tanya")
        
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        self.navigateToColorSheet()
    }
}


