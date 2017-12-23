//
//  ResultViewController.swift
//  jyw-2014111548
//
//  Created by 조예원 on 2017. 12. 23..
//  Copyright © 2017년 조예원. All rights reserved.
//

import UIKit
import CoreData

class ResultViewController: UIViewController {

    var stores: [NSManagedObject] = []
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // 코어데이터를 위한 함수
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Stores")
        do {
            stores = try context.fetch(fetchRequest)
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        // 랜덤함수 호출-> 랜덤으로 식당 추천
        
        let index = Int(arc4random_uniform(UInt32(stores.count)))
        let store = stores[index]
        infoLabel.text = store.value(forKey:"name")as? String
    }


}
