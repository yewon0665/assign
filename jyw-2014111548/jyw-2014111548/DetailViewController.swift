//
//  DetailViewController.swift
//  jyw-2014111548
//
//  Created by 조예원 on 2017. 12. 20..
//  Copyright © 2017년 조예원. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet var textStore: UITextField!
    @IBOutlet var textMenu: UITextField!
    @IBOutlet var textPhone: UITextField!
    @IBOutlet var textMemo: UITextView!
    @IBOutlet var textLocation: UITextField!
    @IBOutlet var textType: UITextField!
    
    var detailStore: NSManagedObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이터를 표현한다.
        if let store = detailStore {
            
            textStore.text = store.value(forKey: "name") as? String
            textMenu.text = store.value(forKey: "menu") as? String
            textPhone.text = store.value(forKey: "phone") as? String
            textMemo.text = store.value(forKey: "memo") as? String
            textLocation.text = store.value(forKey: "location") as? String
            textType.text = store.value(forKey: "type") as? String
        }

    }
}
