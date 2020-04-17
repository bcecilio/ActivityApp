//
//  FeedViewController.swift
//  ActivityApp
//
//  Created by Eric Davenport on 4/17/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  private var activities = [ActivityModel]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    fetchActivities()
    tableViewSetup()
  }
    
  private func tableViewSetup() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  private func fetchActivities() {
    activities = CoreDataManager.shared.fetchMediaObjects()
  }

  
    

}

extension FeedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return activities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as? ActivityCell else {
      fatalError("unable to downcast to ActivityCell")
    }
    let activity = activities[indexPath.row]
    cell.configureCell(activity: activity)
    cell.backgroundColor = .systemTeal
    return cell
  }
    
}

extension FeedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 160
  }
}
