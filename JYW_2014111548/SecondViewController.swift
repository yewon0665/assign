//
//  SecondViewController.swift
//  JYW_2014111548
//
//  Created by 조예원 on 2017. 10. 14..
//  Copyright © 2017년 조예원. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    // 사용자에게 실행 안내를 하기 위한 상위 라벨
    @IBOutlet weak var failLabel: UILabel!
    // 사용자가 한화를 입력할 텍스트필드
    @IBOutlet weak var inputText: UITextField!
    // 뷰 - 텍스트필드에 올바른 값을 입력했을 때만 피커와 버튼이 보일 수 있도록
    @IBOutlet weak var successView: UIView!
    // 사용자 국가와 기능을 선택하기 위한 피커
    @IBOutlet weak var selectPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 앱 실행 - 뷰 보이지 않음
        successView.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 1. testfield 를 위한 함수 선언
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        // 입력된 값에 따라 상위안내label(failLabel.text) 값이 달라짐.
        // 값이 잘 입력된 경우, 뷰를 띄운다.
        if (Int(inputText.text!)! >= 1000) && (Int(inputText.text!)! <= 1000000) {
            failLabel.text = "국가와 기능을 선택하세요."
            successView.isHidden = false // 뷰 출력
        }
        // 값이 잘 입력되지 않은 경우, 뷰를 숨킨다.
        else{
            failLabel.text = "1000원 이상 1000000원 이하의\n 값을 입력하세요."
            successView.isHidden = true
        }
        return true
    }
    
    // 2. 피커를 위한 변수, 함수 선언
    // 피커 배열 - 2개의 피커이므로 배열 2개 선언
    let countryArray: Array<String> = ["미국", "유럽", "일본", "중국"]
    let selectArray: Array<String> = ["환전하기", "시급전환"]
    // 피커 함수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {return countryArray.count
        }
        else {
            return selectArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if component == 0 {
            return countryArray[row]
        }
        else {
            return selectArray[row]
        }
    }
    
    // 하위 화면으로 값 전달을 위한 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            
            // 하위 화면 선언
            let destVC = segue.destination as! ThirdViewController
            
            // 사용자가 입력받은 값을 하위 화면의 입력변수에 전달
            destVC.info = inputText.text
            
            // 첫번째 피커에서 선택한 배열번호를 변수1에 저장
            let num1 = selectPicker.selectedRow(inComponent: 0)
            // 하위 화면의 변수에 전달
            destVC.num1 = num1
            
            // 두번째 피커에서 선택한 배열번호를 변수2에 저장
            let num2 = selectPicker.selectedRow(inComponent: 1)
            // 하위 화면의 변수에 전달
            destVC.num2 = num2
            
            var money : String = ""
            
            // 첫번째 피커-국가(num1) 에 따라 화폐 단위가 결정됨
            if num1 == 0 {                          // 미국을 선택했을 때
                money = "달러로 "
            } else if num1 == 1 {                   // 유럽을 선택했을 때
                // 유럽은 국가가 여러개, 시급전환 기능- 대표 프랑스 선택
                if num2 == 0{
                    money = "유로로 "
                }
                else if num2 == 1 {
                    money = "유로(예.프랑스)로 "
                }
            } else if num1 == 2 {                   // 일본을 선택했을 때
                money = "엔화로 "
            } else if num1 == 3 {                   // 중국을 선택했을 때
                money = "위안으로 "
            }
            
            destVC.title = money + selectArray[num2] // 하위 화면의 타이틀 설정
            // 예) '미국' + '환전하기'
        }
    }

}


