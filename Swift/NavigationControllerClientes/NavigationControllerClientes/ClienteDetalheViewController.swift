//
//  ClienteDetaiheViewController.swift
//  NavigationControllerClientes
//
//  Created by Diego Cavalca on 04/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class ClienteDetalheViewController: UIViewController {

    @IBOutlet weak var lblEmail: UILabel!
    
    var clienteNome: String = ""
    var clienteEmail: String = ""
    var clienteTelefone: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = clienteNome
        lblEmail.text = clienteEmail
    }
    
    
}
