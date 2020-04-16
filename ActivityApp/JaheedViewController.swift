//
//  JaheedViewController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/13/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class JaheedViewController: UIViewController {

   let canvas = Canvas()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo() {
        print("Undo")
        canvas.undo()
    }
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    @objc func handleClear() {
        canvas.clear()
    }
    
    let screenShotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.tintColor = .systemIndigo
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.addTarget(self, action: #selector(handleScreenShot), for: .touchUpInside)
        return button
    }()
    
    @objc func handleScreenShot(){
        canvas.screenshot()
        canvas.showScreenshotEffect()
    }
    
    let recordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "video.fill"), for: .normal)
        button.tintColor = .systemRed
        button.layer.shadowColor = UIColor.black.cgColor
        return button
    }()
    
    @objc func handleRecord(){
       
    }
    
    //----------------------------------------
    
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemYellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let orangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let purpleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemPurple
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleColorChange(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
    }
    
    //----------------------------------------

    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc fileprivate func handleSliderChange() {
        canvas.setStrokeWidth(width: slider.value)
    }
    
    //----------------------------------------

    override func loadView() {
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        
        //---------------------
        //canvas.bounds = CGRect(x: 1, y: 1, width: 1, height: -10)
        //---------------------
        
        setupLayout()
    }
    //----------------------------------------

    
    private func setupLayout() {
        
        let colorsStackView = UIStackView(arrangedSubviews: [
            yellowButton,
            redButton,
            blueButton,
            greenButton,
            orangeButton,
            purpleButton])
        
        colorsStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton,
            screenShotButton,
            colorsStackView,
            slider,
            ])
        
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
}
