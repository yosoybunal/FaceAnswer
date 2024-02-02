//
//  User+CoreDataProperties.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 2.02.2024.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var score: Int64
    @NSManaged public var selectedCategory: Dictionary<String, Bool>?

}

extension User : Identifiable {

}
