//
//  DatabaseService.swift
//  ActivityApp
//
//  Created by Jaheed Haynes on 4/15/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

import Foundation
import FirebaseFirestore

struct Activity {
  let title: String
  let description: String
  
  init?(_ dictionary: [String: Any]) {
    guard let title = dictionary["title"] as? String,
      let description = dictionary["description"] as? String else {
        return nil
    }
    self.title = title
    self.description = description
  }
}

class DatabaseService {
  static let activityCollection = "createdActivities"

  private let db = Firestore.firestore()

  public func loadActivities(completion: @escaping (Result<[Activity], Error>) -> ()) {
    db.collection(DatabaseService.activityCollection).getDocuments { (snapshot, error) in
      if let error = error {
        completion(.failure(error))
      } else if let snapshot = snapshot {
        let titleList = snapshot.documents.compactMap { Activity($0.data())}
        completion(.success(titleList))
      }
    }
  }
  
  /*
   // MARK: Database service test
   private var testActivities = [Activity]() {
     didSet {
       testLabel.text = testActivities[1].title
     }
   }
   private var db = DatabaseService()
   private func dbServiceTest() {
     db.loadActivities { (result) in
       switch result {
       case .failure(let error):
         print("Error loading titles: \(error)")
       case .success(let activities):
         self.testActivities = activities
         print("activities loaded")
       }
     }
   }
   */

}
