//
//  ThirdViewController.swift
//  JYW_2014111548
//
//  Created by 조예원 on 2017. 10. 14..
//  Copyright © 2017년 조예원. All rights reserved.
//




import UIKit

class ThirdViewController: UIViewController {
    
    // 입력된 값과 결과를 출력할 라벨 선언
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    // 상위 화면의 선택에 따라 이미지가 바뀌는 기능을 위한 변수 선언
    @IBOutlet weak var img: UIImageView!
    let usaImage = UIImage(named: "noun_90362_cc.png")
    let euImage = UIImage(named: "noun_90364_cc.png")
    let japImage = UIImage(named: "noun_90376_cc.png")
    let chiImage = UIImage(named: "noun_90376_cc.png")
    
    // 상위 화면의 선택에 따라 출력문이 바뀌는 기능을 위한 변수 선언
    @IBOutlet weak var outTextLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    // 상위 화면으로부터 전달될 값을들 저장하는 변수
    var info: String?   // 사용자가 입력한 금액
    var num1: Int?      // 첫번째 피커 - 국가 선택
    var num2: Int?      // 두번째 피커 - 기능 선택
    
    // 사용자가 두번째 피커(기능)를 선택한 값에 따라 조건문을 나눈다.
    // 다시 첫번째 피커(국가)를 선택한 값에 따라 조건문을 나눈다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // 사용자가 입력한 값을 화면에 출력
        inputLabel.text = info! + "원"
        
        // 두번째 피커 - '환전 기능'을 선택하였을 때
        if num2 == 0 {
            outTextLabel.text = "환전된 값 :"
            
            // 첫번째 피커의 값에 따른 조건문
            if num1 == 0{        // 미국일 때
                outputLabel.text = String(Float(info!)!/1130) + "달러"
                img.image = usaImage
                textLabel.text = "1달러는 1130원 입니다."
            }
            else if num1 == 1{   // 유럽일 때
                outputLabel.text = String(Float(info!)!/1330) + "유로"
                img.image = euImage
                textLabel.text = "1유로는 1330원 입니다."
            }
            else if num1 == 2{   // 일본일 때
                outputLabel.text = String(Float(info!)!/10.10) + "엔"
                img.image = japImage
                textLabel.text = "100엔은 1010원 입니다."
            }
            else if num1 == 3{    // 중국일 때
                outputLabel.text = String(Float(info!)!/170) + "위안"
                img.image = chiImage
                textLabel.text = "1위안은 170원 입니다."
            }
        }
        // 두번째 피커 - 시급전환 기능을 선택하였을 때
        else if num2 == 1{
            outTextLabel.text = "시급 전환 :"
            
            // 첫번째 피커의 값에 따른 조건문
            if num1 == 0{         // 미국일 때
                outputLabel.text = String(Float(info!)!/12000) + "시간"
                textLabel.text = "미국의 최저시급은 \n 약 12000원 입니다. "
                img.image = usaImage
            }
                //유럽일 때
            else if num1 == 1{    // 유럽일 때
                outputLabel.text =  String(Float(info!)!/12000) + "시간"
                textLabel.text = "프랑스의 최저시급은 \n 약 12000원 입니다. "
                img.image = euImage
            }
                // 일본일 때
            else if num1 == 2{    // 일본일 때
                outputLabel.text = String(Float(info!)!/8300) + "시간"
                textLabel.text = "일본의 최저시급은 \n 약 8300원 입니다. "
                img.image = japImage
            }
                // 중국일 때
            else if num1 == 3{    // 중국일 때
                outputLabel.text = String(Float(info!)!/3300) + "시간"
                textLabel.text = "중국의 최저시급은 \n 약 3300원 입니다. "
                img.image = chiImage
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

