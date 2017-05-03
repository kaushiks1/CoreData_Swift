//
//  Student_Form+CoreDataProperties.swift
//  CoreData_Swift
//
//  Created by Leo on 1/11/17.
//  Copyright © 2017 Leo. All rights reserved.
//

import Foundation
import CoreData


extension Student_Form {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student_Form> {
        return NSFetchRequest<Student_Form>(entityName: "Student_Form");
    }

    @NSManaged public var city: String?

}
