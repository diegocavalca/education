//
//  TaskDetailViewController.swift
//  TaskNote
//
//  Created by Diego Cavalca on 05/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {

    var task: Task? = nil
    
    @IBOutlet weak var txtDescricao: UITextField!
    
    // Instancia do CoreData / Tratamento de erro (ponteiro)...
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var err: NSErrorPointer = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Modo edição...
        if task != nil {
            txtDescricao.text = task?.desc
        }
    }
    
    // Criando novo registro na classe Task...
    func createTask() {
        
        // Carregando estrutura da classe Task...
        let entityDescripition = NSEntityDescription.entityForName("Task", inManagedObjectContext: managedObjectContext!)
        
        // Instância de novo registro...
        let task = Task(entity: entityDescripition!, insertIntoManagedObjectContext: managedObjectContext)
        
        // Preenchendo campos...
        task.desc = txtDescricao.text
        
        // Salvando registro...
        managedObjectContext?.save(self.err)
    }
    
    func editTask() {
        task?.desc = txtDescricao.text
        self.managedObjectContext!.save(nil)
    }
    
    @IBAction func saveTask(sender: AnyObject) {
        
        // Salvar ação (Edição ou Inclusão...)
        if task != nil {
            editTask()
        } else {
            createTask()
        }                
        
        // Voltar para tela anterior...
        self.navigationController!.popViewControllerAnimated(true)
        
    }

}
