//
//  LeftDrawerTableViewController.swift
//  QTFloatingDrawer_Example
//
//  Created by Quixom Technology on 13/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class LeftDrawerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if indexPath.row == 2 {
            appDelegate.centerViewController = appDelegate.sourcePageViewController()
        } else if indexPath.row == 3 {
            appDelegate.centerViewController = appDelegate.drawerSettingsViewController()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
 

}
