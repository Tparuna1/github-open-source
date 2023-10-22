//
//  ViewController.swift
//  Assignment N14 TBCAcademy
//
//  Created by tornike <parunashvili on 21.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numberOne: UITextField!
    @IBOutlet weak var numberTwo: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var operationSwitch: UISwitch!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operationSwitch.onTintColor = UIColor.secondarySystemFill
        operationSwitch.thumbTintColor = UIColor.tintColor
        view.backgroundColor = UIColor.systemTeal
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            label.text = "Greatest common denominator"
        } else {
            label.text = "Least common multiple"
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let text1 = numberOne.text, let text2 = numberTwo.text,
              let number1 = Int(text1), let number2 = Int(text2) else {
            result.text = "Invalid input"
            return
        }
        
        if operationSwitch.isOn {
            let gcd = calculateGCD(a: number1, b: number2)
            result.text = "\(gcd)"
        } else {
            let lcm = calculateLCM(a: number1, b: number2)
            result.text = "\(lcm)"
        }
    }
    
    func calculateGCD(a: Int, b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return abs(a)
    }

    func calculateLCM(a: Int, b: Int) -> Int {
        return abs(a * b) / calculateGCD(a: a, b: b)
    }
}



