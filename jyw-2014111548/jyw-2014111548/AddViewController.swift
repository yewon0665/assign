//
//  AddViewController.swift
//  jyw-2014111548
//
//  Created by 조예원 on 2017. 12. 20..
//  Copyright © 2017년 조예원. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 변수
    @IBOutlet weak var textStore: UITextField!
    @IBOutlet weak var textMenu: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textMemo: UITextView!
    @IBOutlet weak var textPicker: UIPickerView!
    
    // 피커변수
    let typeArray: Array<String> = ["한식", "중식", "일식", "양식", "디저트", "기타"]
    let locationArray: Array<String> = ["강남", "건대", "홍대", "종로", "태릉", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
    
    // 저장 버튼 함수
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Stores", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textStore.text, forKey: "name")
        object.setValue(textMenu.text, forKey: "menu")
        object.setValue(textPhone.text, forKey: "phone")
        object.setValue(textMemo.text, forKey: "memo")
        object.setValue( locationArray[self.textPicker.selectedRow(inComponent: 0)] , forKey: "location")
        object.setValue( typeArray[self.textPicker.selectedRow(inComponent: 1)], forKey: "type")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
       self.navigationController?.popViewController(animated: true)
    }
    
    // 피커 함수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return locationArray.count
        } else {
            return typeArray.count }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return locationArray[row] }
        else {
            return typeArray[row] }
    
    }
    
}

