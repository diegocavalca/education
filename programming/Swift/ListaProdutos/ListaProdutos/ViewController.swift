//
//  ViewController.swift
//  ListaProdutos
//
//  Created by Diego Cavalca on 04/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!

    var TableData:[(name:String, photo:String)] = [("iPhone 3G","iphone-3g"),("iPhone 4s","iphone-4s"),("iPhone 5","iphone-5"),("iPhone 6 Plus","iphone-6plus")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = TableData[indexPath.row].name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Instanciando ViewController de detalhes...
        let detailView = segue.destinationViewController as! DetailsViewController
        
        // Capturando INDEX da celula selecionada...
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) as NSIndexPath?
        
        // Passando dados pra view de detalhes...
        // IMPORTANTE: Tupla (neste caso) de destino deve ter mesma estrutura da origem...
        detailView.device = TableData[indexPath!.row]
        
    }
    
    
}

