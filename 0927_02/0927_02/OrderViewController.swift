//
//  OrderViewController.swift
//  0927_02
//
//  Created by 조예원 on 2017. 9. 27..
//  Copyright © 2017년 조예원. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    
    @IBOutlet weak var infoLabel: UILabel!
    var info: String?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let contentString = info {
            infoLabel.text = contentString
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
