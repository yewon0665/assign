//
//  ViewController.swift
//  0927_02
//
//  Created by 조예원 on 2017. 9. 27..
//  Copyright © 2017년 조예원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pizzaChicken: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderView" {
            
            
            // 목적 세그 설정.
            let destVC = segue.destination as! OrderViewController
            
            // 세그먼트에서 선택된 값을 저장.
            let ordered: String! = pizzaChicken.titleForSegment(at: pizzaChicken.selectedSegmentIndex)
            
            // 목적 세그의 타이틀 설정.
            destVC.title = ordered
            
            // label 에 적을 변수 선언. 초기화.
            var outString: String = "감사합니다!!\n 주문내역: <"
            
            // 세그먼트 값 추가.
            outString += ordered
            outString += ">, 맞나요?"
            
            
            destVC.info = outString
            
            
        } }
    
    
    
    
    
    
    
    
    
    
}

