//
//  CoreDataManager.swift
//  ActivityApp
//
//  Created by Tanya Burke on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
  
  // creating a singleton
  private init() {}
  static let shared = CoreDataManager()
  
  private var mediaObjects = [ActivityModel]()
  
  // get instance of the NSManagedObjectContext from the AppDelegate
  private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  // NSManagedObjectContext does saving, fetching on NSMangedObjects....
  
  // CRUD - create
  // converting a UIImage to Data
  func createMediaObect(_ imageData: Data, videoURL: URL?) -> ActivityModel {
    let mediaObject = ActivityModel(entity: ActivityModel.entity(), insertInto: context)
    mediaObject.dateCreated = Date() // current date
    mediaObject.id = UUID().uuidString // unique string
    mediaObject.image = imageData // both video and image objects has an image
    if let videoURL = videoURL { // if exist, this means it's a video object
      // convert a URL to Data
      do {
        mediaObject.video = try Data(contentsOf: videoURL)
      } catch {
        print("failed to convert URL to Data with error: \(error)")
      }
    }
    
    // save the newly created mediaObject entity instance to the NSManagedObjectContext
    do {
      try context.save()
    } catch {
      print("failed to save newly created media object with error: \(error)")
    }
    return mediaObject
  }
  
  // read
  func fetchMediaObjects() -> [ActivityModel] {
    do {
      mediaObjects = try context.fetch(ActivityModel.fetchRequest()) // fetch all the created objects from the MediaObject entity
    } catch {
      print("failed to fetch media objects with error: \(error)")
    }
    return mediaObjects
  }
  
  // update
  
  // delete
  
}

