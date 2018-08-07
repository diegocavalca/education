//
//  ClientesTableViewController.swift
//  TableViewREST
//
//  Created by Diego Cavalca on 01/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class ClientesTableViewController: UITableViewController {
    
    // Objeto de comunicação com a API...
    var rApi = RequestAPI()
    
    // Objeto de dados da tabela...
    var TableData = Array<AnyObject>()
    
    // Função de validação dos dados da tabela...
    func populateTableData(data:NSData) -> Array<AnyObject>
    {
        // Array de retorno para popular tabela...
        var resultData = Array<NSDictionary>()
        
        // Parse Object JSON...
        let parsedObject: AnyObject = rApi.parseJSON(data)
        
        /************************************************
        POPULANDO RETORNO DE ACORDO COM O JSON OBTIDO...
        Mais em: http://www.raywenderlich.com/82706/working-with-json-in-swift-tutorial
        ************************************************/
        
        /***
        ---> Exemplo 1: Listagem na raiz do Objeto...
        JSON: [{"CODIGO":"1","NOME":"Diego Cavalca","TELEFONE":"(14)98888-7777","EMAIL":"diegocavalca.ti@gmail.com"}]
        Em: http://diegocavalca.com/articles/sistemadeclientes/api/clientes
        */
        if let items = parsedObject as? NSArray {
            for item in items {
                resultData.append(item as NSDictionary)
            }
        }
            
        /***
        ---> Exemplo 2: Listagem dentro de um Objeto...
        JSON: Retorno da URL https://itunes.apple.com/search?term=Turistforeningen&media=software
        */
        else if let json = parsedObject as? NSDictionary{
            
                if let items = json["results"] as? NSArray {
                    for item in items{
                        resultData.append(item as NSDictionary)
                    }
                }
            }
        
        return resultData
    }
    
    func tableViewRefresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Consumir Webservice (API)...
        rApi.getData("http://diegocavalca.com/articles/sistemadeclientes/api/clientes", { data, error -> Void in
            if (data != nil) {
                
                // Carregar e tratar os dados da API...
                self.TableData = self.populateTableData(data) as [NSDictionary];

                // Atualizar tabela na tela...
                self.tableViewRefresh()
                
            } else {
                println("api.getData failed")
                println(error)
            }
        })
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as ClientesCellTableViewCell
        
        // Instanciando resultado (linha)...
        if let item = TableData[indexPath.row] as? NSDictionary {
            
            // Campo NOME...
            if let nome: AnyObject? = item["NOME"] {
                cell.lblNome.text = nome as? String
            }else{
                cell.lblNome.text = ""
            }
            
            // Campo EMAIL...
            if let email: AnyObject? = item["EMAIL"] {
                cell.lblEmail.text = email as? String
            }else{
                cell.lblEmail.text = "<Nenhum email cadastrado>"
            }
            
        }
        
        return cell
    }


}
