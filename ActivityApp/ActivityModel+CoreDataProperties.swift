//
//  ActivityModel+CoreDataProperties.swift
//  
//
//  Created by Tanya Burke on 4/15/20.
//
//

import Foundation
import CoreData


extension ActivityModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActivityModel> {
        return NSFetchRequest<ActivityModel>(entityName: "ActivityModel")
    }

    @NSManaged public var video: Data?
    @NSManaged public var image: Data?
    @NSManaged public var activitName: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var id: UUID?

}
