//
//  ViewController.swift
//  HelloWorld
//
//  Created by Diego Cavalca on 30/04/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var edtName: UITextField!
    
    // Evento de aviso que a view foi carregada...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("viewDidLoad()")
        lblMessage.hidden = true
        
    }
    
    // Evento de aviso que a view irá aparecer...
    override func viewWillAppear(animated: Bool) {
        NSLog("viewWillAppear()")
    }
    
    // Evento de aviso que a view apareceu...
    override func viewDidAppear(animated: Bool){
        NSLog("viewDidAppear()");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage(sender: AnyObject) {
        NSLog("Cliquei no botão 'Mostrar mensagem Padrão'")

        lblMessage.text = "Hello, World!"
        lblMessage.hidden = false
        
    }

    @IBAction func copyName(sender: AnyObject) {
        NSLog("Clique no botão 'Exibir!'")
        
        lblMessage.text = edtName.text
        lblMessage.hidden = false
    }
}

