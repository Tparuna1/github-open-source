//
//  ViewController.swift
//  Assignment N21 TBC Academy
//
//  Created by tornike <parunashvili on 08.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculateFactorialsAndPrintWinner()
    }

    func generateRandomNumberInRange(_ lowerBound: Int, _ upperBound: Int) -> Int {
        return Int.random(in: lowerBound...upperBound)
    }

    func calculateFactorial(_ number: Int) -> String {
        if number <= 1 {
            return "1"
        }

        var result = "1"
        for i in 2...number {
            result = multiplyStrings(result, "\(i)")
        }
        return result
    }

    func calculateFactorialAsync(number: Int, completion: @escaping (String) -> Void) {
        DispatchQueue.global().async { [unowned self] in
            let factorial = self.calculateFactorial(number)
            completion(factorial)
        }
    }

    func calculateFactorialsAndPrintWinner() {
        let number1 = generateRandomNumberInRange(20, 50)
        let number2 = generateRandomNumberInRange(20, 50)

        let group = DispatchGroup()

        var winnerThread: String = ""

        group.enter()
        calculateFactorialAsync(number: number1) { result in
            print("Factorial of number1 (\(number1)): \(result)")
            winnerThread = "Thread 1"
            group.leave()
        }

        group.enter()
        calculateFactorialAsync(number: number2) { result in
            print("Factorial of number2 (\(number2)): \(result)")
            winnerThread = "Thread 2"
            group.leave()
        }

        group.notify(queue: .global()) {
            print("Winner thread: \(winnerThread)")
        }
    }

    func multiplyStrings(_ num1: String, _ num2: String) -> String {
        var result = Array(repeating: 0, count: num1.count + num2.count)

        for i in (0..<num1.count).reversed() {
            for j in (0..<num2.count).reversed() {
                let product = (num1[num1.index(num1.startIndex, offsetBy: i)].wholeNumberValue ?? 0) * (num2[num2.index(num2.startIndex, offsetBy: j)].wholeNumberValue ?? 0)
                let sum = product + result[i + j + 1]
                result[i + j + 1] = sum % 10
                result[i + j] += sum / 10
            }
        }

        let strResult = result.map { String($0) }.joined()
        if let firstNonZero = strResult.firstIndex(where: { $0 != "0" }) {
            return String(strResult[firstNonZero...])
        } else {
            return "0"
        }
    }
}


