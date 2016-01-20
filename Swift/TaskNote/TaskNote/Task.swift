//
//  Task.swift
//  TaskNote
//
//  Created by Diego Cavalca on 05/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import Foundation
import CoreData

// Métodos do objC para CoreData...
@objc(Task)

class Task: NSManagedObject {

    @NSManaged var desc: String

}
