//
//  LocationRecViewController.swift
//  jyw-2014111548
//
//  Created by 조예원 on 2017. 12. 23..
//  Copyright © 2017년 조예원. All rights reserved.
//

import UIKit
import CoreData

class LocationRecViewController: UIViewController {

    var stores: [NSManagedObject] = []
    
    @IBOutlet weak var infoLabel: UILabel! // 선택한 장소를 표현
    @IBOutlet weak var infoLabel2: UILabel! // 랜덤추천된 장소를 표현
    
    var info: String?
    // 랜덤 처리를 위한 변수 선언
    var names: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contentString = info {
            infoLabel.text = contentString
            
        }
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
        for i in 0 ... (stores.count - 1) {
            
            let store = stores[i]
            let type: String = store.value(forKey: "location") as! String
            let loc: String = store.value(forKey:"name") as! String

            
            // 선택한 장소가 저장된 식당들만 추출하여 배열을 새로 만든다.
            if ( type == infoLabel.text ) {
                names.append(loc)
            }
        }
        // 그 배열에서 랜덤을 추출한다.
        if (names.count > 0) {
            let index = Int(arc4random_uniform(UInt32(names.count)))
            let name = names[index]
            infoLabel2.text = name
        }
        else{ // 선택한 장소에, 등록된 식당이 없는 경우
            infoLabel2.text = "등록된 식당이 없습니다. "
        }
    }

}
