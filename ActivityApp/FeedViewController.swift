//
//  FeedViewController.swift
//  ActivityApp
//
//  Created by Brendon Cecilio on 4/17/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  private var refreshControl: UIRefreshControl!
  
  private var activities = [ActivityModel]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
        loadActivities()
        tableViewSetup()
    }
    

  func tableViewSetup() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func configureRefreshControl() {
    refreshControl = UIRefreshControl()
    tableView.refreshControl = refreshControl
    refreshControl.addTarget(self, action: #selector(loadActivities), for: .valueChanged)
  }
  
  @objc private func loadActivities() {
    activities = CoreDataManager.shared.fetchMediaObjects()
//    DispatchQueue.main.async {
//      self.refreshControl.endRefreshing()
//    }
  }
  

}

extension FeedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    var height : CGFloat
    let activity = activities[indexPath.row]
    if activity.title == "Strike A Pose Twice" {
      height = 120
    } else {
      height = 230
    }
    return height
  }
}

extension FeedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return activities.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as? ActivityCell else {
      fatalError("unable to downcast cell")
    }
    let activity = activities[indexPath.row]
    cell.configureCell(for: activity)
    return cell
  }
}
