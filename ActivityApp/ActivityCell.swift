//
//  ActivityCell.swift
//  ActivityApp
//
//  Created by Eric Davenport on 4/17/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var activityImageView: UIImageView!
  
  func configureCell(activity: ActivityModel) {
    titleLabel.text = activity.title ?? "No title"
    guard let data = activity.image else { return }
    activityImageView.image = UIImage(data: data)
  }
  
}
