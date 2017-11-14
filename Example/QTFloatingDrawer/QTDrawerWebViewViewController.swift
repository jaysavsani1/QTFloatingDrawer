//
//  QTDrawerWebViewViewController.swift
//  QTFloatingDrawer_Example
//
//  Created by Quixom Technology on 13/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class QTDrawerWebViewViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url  = URL(string: "https://github.com/KyleGoddard/KGFloatingDrawer")
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func toggleLeftDrawer(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender: sender, animated: false)
    }
    
    @IBAction func toggleRightDrawer(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.toggleRightDrawer(sender: sender, animated: true)
    }
    
}
