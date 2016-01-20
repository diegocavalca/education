//
//  TaskManagerTableViewController.swift
//  TaskNote
//
//  Created by Diego Cavalca on 05/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit
import CoreData

class TaskManagerTableViewController: UITableViewController {

    // Instancia do CoreData / Tratamento de erro (ponteiro)...
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var err: NSErrorPointer = nil
    
    // Registros da tabela...
    var TableData = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableData = selectAllRegisters()
        
        // Atualizar tabela...
        self.refreshControl?.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
        
    func selectAllRegisters () -> NSMutableArray {
        
        var dataSource = NSMutableArray()
        
        // Objeto de consulta de dados da classe no CoreData...
        var fetchRequest = NSFetchRequest(entityName: "Task")
        
        // Fetch registers...
        var tasks: NSArray! = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: err)
        if(tasks.count>0){
            for index in 0...tasks.count-1 {
                let task = (tasks[index] as? Task)!
                dataSource.addObject(task)
            }
        }
        
        return dataSource
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let register = TableData[indexPath.row] as! Task
        cell.textLabel?.text = register.desc as String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            // Objeto de consulta de dados da classe no CoreData...
            var fetchRequest = NSFetchRequest(entityName: "Task")
            
            // Fetch registers...
            var tasks: NSArray! = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: err)
            
            // Selecionando registro...
            let task = tasks.objectAtIndex(indexPath.row) as! Task
            
            // Excluindo registro...
            let managedObject:NSManagedObject = tasks.objectAtIndex(indexPath.row) as! NSManagedObject
            self.managedObjectContext?.deleteObject(managedObject)
            self.managedObjectContext?.save(nil)
            
            // Removendo da lista...
            TableData.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "editTask" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let taskDetail:TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            
            // Objeto de consulta de dados da classe no CoreData...
            var fetchRequest = NSFetchRequest(entityName: "Task")
            
            // Fetch registers...
            var tasks: NSArray! = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: err)
            
            // Selecionando registro...
            let task = tasks.objectAtIndex(indexPath!.row) as! Task
            
            taskDetail.task = task
        }
    }

 
    
}
