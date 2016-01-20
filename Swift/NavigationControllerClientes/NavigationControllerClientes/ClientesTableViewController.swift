//
//  ClientesTableViewController.swift
//  NavigationControllerClientes
//
//  Created by Diego Cavalca on 02/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class ClientesTableViewController: UITableViewController {

    var notification = DCNotification()
    
    // Objeto de comunicação com a API...
    var rApi = DCRequest()
    
    // Objeto de dados da tabela...
    var TableData = Array<AnyObject>()
    
    // Função de validação dos dados da tabela...
    func populateTableData(data:NSData) -> Array<AnyObject>
    {
        NSLog("populateTableData()")
        
        // Array de retorno para popular tabela...
        var resultData = Array<NSDictionary>()
        
        // Parse Object JSON...
        let parsedObject: AnyObject = rApi.parseJSON(data)
        
        /************************************************
        POPULANDO RETORNO DE ACORDO COM O JSON OBTIDO...
        ************************************************/
        
        if let registers = parsedObject as? NSArray{
                    
            for client in registers{
                
                let node = client as! NSDictionary
                resultData.append(node)
                
            }
            
        }
        
        return resultData
    }
    func tableViewRefresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad()")
                
        // Consumir Webservice (API)...
        rApi.getData("http://diegocavalca.com/articles/sistemadeclientes/api/clientes", completionHandler: { data, error -> Void in
            NSLog("Get Data!")
            if (data != nil) {
                
                // Carregar e tratar os dados da API...
                self.TableData = self.populateTableData(data) as! [NSDictionary];
                
                // Atualizar tabela na tela...
                self.tableViewRefresh()
                
            } else {
                self.notification.alert("INFORMAÇÃO", msg: "Não foi possível consultar os dados dos clientes. Verifique sua conexão e tente novamente.", buttonTitle: "OK")
            }
        })
        
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return TableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ClientesTableViewCell
        
        cell.lblNome.text = TableData[indexPath.row]["NOME"] as? String
        cell.lblEmail.text = TableData[indexPath.row]["EMAIL"] as? String
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailView = segue.destinationViewController as! ClienteDetalheViewController
        
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) as NSIndexPath?
        
        detailView.clienteNome = TableData[indexPath!.row]["NOME"] as! String
        detailView.clienteEmail = TableData[indexPath!.row]["EMAIL"] as! String
        detailView.clienteTelefone = TableData[indexPath!.row]["TELEFONE"] as! String
        
    }
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.notification.alert("INDICE", msg: String(indexPath.row), buttonTitle:"OK" )
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

    
}
