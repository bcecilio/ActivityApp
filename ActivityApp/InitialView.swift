//
//  InitialView.swift
//  ActivityApp
//
//  Created by Tanya Burke on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class InitialView: UIView {

     public lazy var logoGifImageView: UIImageView = {
         let gifImage =  UIImageView()
            gifImage.loadGif(name: "kidGif")
        gifImage.backgroundColor = .systemBackground
            gifImage.contentMode = .scaleAspectFit
            gifImage.animationDuration = 5.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 2.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false
                return gifImage
            }()
        
      public lazy var logoLabel: UILabel = {
       let label =  UILabel()
        label.backgroundColor = .systemBackground
        label.textColor = .systemOrange
        label.font = UIFont(name: "Chalkduster", size: 50.0)
        label.textAlignment = .center
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false
        label.text = "ActivityApp"
      
              return label
          }()
        
            override init(frame: CGRect) {
                super.init(frame: UIScreen.main.bounds)
                commonInit()
            }
            
            required init?(coder: NSCoder) {
                super.init(coder: coder)
                commonInit()
                
            }

        private func commonInit(){
            loadingGif()
           loadlabel()
        }
        
    private func loadlabel(){
        addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        logoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        logoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        logoLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
            
            private func loadingGif() {
                addSubview(logoGifImageView)
                logoGifImageView.translatesAutoresizingMaskIntoConstraints = false
                logoGifImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
                logoGifImageView.bottomAnchor.constraint(equalTo:bottomAnchor, constant: 0).isActive = true
                logoGifImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -15).isActive = true
                logoGifImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15).isActive = true
            }
        
      
    }

