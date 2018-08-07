//
//  NavigationViewController.swift
//  NavigationControllerClientes
//
//  Created by Diego Cavalca on 02/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom nav bar...
        var nav = self.navigationBar
        nav.tintColor = UIColor.orangeColor()
        /*nav.barTintColor = UIColor.orangeColor()
        nav.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]*/
    }

    
}
