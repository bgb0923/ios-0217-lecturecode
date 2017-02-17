//
//  ViewController.swift
//  playingWithCollections
//
//  Created by Johann Kerr on 2/16/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did loading")
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Getting me some rows")
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        print("heres a cell \(indexPath.row)")
        cell.backgroundColor = UIColor.getRandomColor()
        return cell
    }
    


   

}

