//
//  ActivityCell.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/17/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

//  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var activityImageView: UIImageView!
  
  func configureCell(for activity: ActivityModel) {
//    titleLabel.text = activity.title ?? "No Title"
    guard let imageData = activity.image else { return }
    activityImageView.image = UIImage(data: imageData)
  }
  
}
