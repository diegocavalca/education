//
//  DCNotification.swift
//  NavigationControllerClientes
//
//  Created by Diego Cavalca on 02/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class DCNotification{
    func alert(title:String, msg:String, buttonTitle:String ) -> Void {
        let alert = UIAlertView()
        alert.title = title
        alert.message = msg
        alert.addButtonWithTitle(buttonTitle)
        alert.show()
    }
}
