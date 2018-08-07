//
//  Product.swift
//  persistence
//
//  Created by Ricardo Rauber on 9/10/14.
//  Copyright (c) 2014 BEPiD POA. All rights reserved.
//

import Foundation
import CoreData

@objc(Product)

class Product: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var price: NSNumber
    @NSManaged var company: NSManagedObject

}
