//
//  ActivityModel+CoreDataProperties.swift
//  ActivityApp
//
//  Created by Tanya Burke on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//
//

import Foundation
import CoreData


extension ActivityModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActivityModel> {
        return NSFetchRequest<ActivityModel>(entityName: "ActivityModel")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var id: String?
    @NSManaged public var image: Data?
    @NSManaged public var title: String?
    @NSManaged public var video: Data?

}
