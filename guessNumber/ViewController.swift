//
//  ViewController.swift
//  guessNumber
//
//  Created by Hoang Tung on 10/22/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomNumberLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBOutlet weak var guessButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.alpha = 0
    }

    @IBAction func onPress(_ sender: Any) {
        let randomNumber = Int.random(in: 1...100)
        resultLabel.alpha = 1
        
        randomNumberLabel.text = String(randomNumber)
        
        guard let inputString = inputNumber.text else {
            resultLabel.text = "Bạn chưa nhập giá trị!"
            randomNumberLabel.alpha = 0
            return
        }
        
        guard let input = Int(inputString) else {
            resultLabel.text = "Giá trị bạn nhập chưa đúng!"
            randomNumberLabel.alpha = 0
            return
        }
        
        switch input {
        case _ where input > 0 && input < randomNumber:
            resultLabel.text = "Sai rồi, giá trị bạn nhập nhỏ quá!!"
            randomNumberLabel.alpha = 1
            break
        case _ where input > randomNumber && input <= 100:
            resultLabel.text = "Sai rồi, giá trị bạn nhập lớn quá!!"
            randomNumberLabel.alpha = 1
            break
        case randomNumber:
            resultLabel.text = "Chúc mừng, bạn đã đoán đúng !!!"
            randomNumberLabel.alpha = 1
            break
        default:
            resultLabel.text = "Giá trị bạn nhập chưa đúng!"
            randomNumberLabel.alpha = 0
            break
        }
    }
}

