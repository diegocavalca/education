//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Diego Cavalca on 01/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var people = ["Luiz Carlos Cavalca", "Sheila de Fátima Borges Cavalca", "Viviane de Fátima Cavalca", "Diego Luiz Cavalca"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath : indexPath) as CustomTableViewCell
        
        cell.lblName.text = people[indexPath.row]
        
        cell.lblNumber.text = String(indexPath.row+1)
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    

}

