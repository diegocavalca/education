//
//  ViewController.swift
//  persistence
//
//  Created by Ricardo Rauber on 9/10/14.
//  Copyright (c) 2014 BEPiD POA. All rights reserved.
//

import UIKit
import CoreData
import CloudKit

class ViewController: UIViewController {

    // MARK: - Properties
    var dataSource = NSMutableArray()
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.execUserDefaults()
        self.execCoreData()
        self.execCloudKit()
    }
    
    // MARK: - Content
    func execUserDefaults () {
        
        // Get array from user defaults
        var defaultsArray = NSMutableArray()
        if (NSUserDefaults.standardUserDefaults().arrayForKey("defaultsArray") != nil) {
            defaultsArray.addObjectsFromArray( NSUserDefaults.standardUserDefaults().arrayForKey("defaultsArray")! )
        }
        
        // Add object
        defaultsArray.addObject("Defaults: \(defaultsArray.count + 1)")
        
        // Set new array in the user defaults
        NSUserDefaults.standardUserDefaults().setObject(defaultsArray, forKey: "defaultsArray")
        
        // Synchronize
        NSUserDefaults.standardUserDefaults().synchronize()
        
        // Add values to data source
        for index in 0...defaultsArray.count-1 {
            self.dataSource.addObject(defaultsArray[index])
        }
    }
    
    func execCoreData () {
        
        // Get Core Data Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext: NSManagedObjectContext! = appDelegate.managedObjectContext
        
        // Create the error pointer
        var err: NSErrorPointer = nil
        
        // Add Company
        var apple: Company = (NSEntityDescription.insertNewObjectForEntityForName("Company", inManagedObjectContext: managedObjectContext) as? Company)!
        apple.name = "Apple"
        
        // Add Products
        var iPad: Product = (NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: managedObjectContext) as? Product)!
        iPad.name = "iPad"
        iPad.price = 299
        iPad.company = apple
        
        var iPhone: Product = (NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: managedObjectContext) as? Product)!
        iPhone.name = "iPhone"
        iPhone.price = 199
        iPhone.company = apple
        
        // Save Context
        managedObjectContext.save(err)
        
        // Create the fetch request
        var fetchRequest = NSFetchRequest(entityName: "Company")
        
        // Fetch Companies
        var companies: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error: err)
        for index in 0...companies.count-1 {
            let company = (companies[index] as? Company)!
            self.dataSource.addObject("Company: \(company.name)")
        }
        
        // Fetch Products
        fetchRequest = NSFetchRequest(entityName: "Product")
        var products: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error: err)
        for index in 0...products.count-1 {
            let product = (products[index] as? Product)!
            var company = (product.company as? Company)!
            self.dataSource.addObject("Product: \(company.name) - \(product.name)")
        }
    }
    
    func execCloudKit() {
        
        // Get default container
        let defaultContainer = CKContainer.defaultContainer()
        
        // Get Public database
        let publicDatabase = defaultContainer.publicCloudDatabase
        
        // Create a company
        var apple: CKRecord = CKRecord(recordType: "Company")
        apple.setObject("Apple", forKey: "name")
        
        // Save company
        publicDatabase.saveRecord(apple) { savedCompany, errCompany in
            
            // Create a product
            var iPod = CKRecord(recordType: "Product")
            iPod.setObject("iPod", forKey: "name")
            iPod.setObject(199, forKey: "price")
            iPod.setObject(CKReference(record: apple, action: CKReferenceAction.None), forKey: "company")
            
            // Save product
            publicDatabase.saveRecord(iPod) { savedProduct, errProduct in
                
                // Query
                let predicate = NSPredicate(value: true)
                var query = CKQuery(recordType: "Product", predicate: predicate)
                publicDatabase.performQuery(query, inZoneWithID: nil) { fetchedObjects, errQuery in
                    
                    for product in fetchedObjects {
                        let productName = product.objectForKey("name") as! String
                        self.dataSource.insertObject("Cloud: \(productName)", atIndex: 0)
                    }
                    
                    // Reload tableview
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                }
            }
        }
    }
    
    // MARK: - TableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as!UITableViewCell
        
        var text = cell.viewWithTag(10) as! UILabel
        text.text = "\(self.dataSource[indexPath.row])"
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }


}

