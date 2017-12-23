//
//  RecViewController.swift
//  jyw-2014111548
//
//  Created by 조예원 on 2017. 12. 20..
//  Copyright © 2017년 조예원. All rights reserved.
//

import UIKit

class RecViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    let locationArray: Array<String> = ["강남", "건대", "홍대", "종로", "태릉", "기타"]
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return locationArray[row]
    }
    
    // 하위뷰로 자료 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLocationRec" {
            let destVC = segue.destination as! LocationRecViewController
            let location: String! = locationArray[self.picker.selectedRow(inComponent: 0)]
            destVC.info = location
        }
    }
}
