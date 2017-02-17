//
//  ViewController.swift
//  ProtocolFun
//
//  Created by James Campagno on 2/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Made new baby.")
        
    }
    
    func fun() {
        
        tableView.delegate = self

    }

  


}

