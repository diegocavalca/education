//
//  Company.swift
//  persistence
//
//  Created by Ricardo Rauber on 9/10/14.
//  Copyright (c) 2014 BEPiD POA. All rights reserved.
//

import Foundation
import CoreData

@objc(Company)

class Company: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var products: NSSet

}
