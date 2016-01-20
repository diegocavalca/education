//
//  ViewController.swift
//  Hub
//
//  Created by Diego Cavalca on 13/01/16.
//  Copyright (c) 2016 Diego Cavalca. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPhone(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel:988887654")!)
    }
    
    @IBAction func buttonWebsite(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://diegocavalca.com")!)
    }

    @IBAction func buttonLinkedin(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://br.linkedin.com/in/diegocavalca")!)
    }
    
    @IBAction func buttonLattes(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://lattes.cnpq.br/3677080775789758")!)
    }
    
    @IBAction func buttonEmail(sender: AnyObject) {
        var picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        picker.setToRecipients(["contato@diegocavalca.com"])
        picker.setSubject("Contato HUB - Diego Cavalca")
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
}

