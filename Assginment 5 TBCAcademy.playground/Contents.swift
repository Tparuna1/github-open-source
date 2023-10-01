import UIKit




// 1.

func factorialOfNumber(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) -> Int {
    return a * b * c * d * e * f
}

var x = 1
var y = 2
var z = 3
var p = 4
var w = 5
var h = 6

let sum = factorialOfNumber(a: x, b: y, c: z, d: p, e: w, f: h )

print(factorialOfNumber(a: x, b: y, c: z, d: p, e: w, f: h))


// 2.

func fibonacciNumbers(numSteps: Int) -> [Int] {
    var sequence = [0, 1]
    for _ in 0...numSteps {
        let first = sequence[sequence.count - 2]
        let second = sequence.last!
        sequence.append(first + second)
    }
    return sequence
}

print(fibonacciNumbers(numSteps: 17))

// 3.


func isPalindrome(_ str: String) -> Bool {
    let cleanString = str.lowercased().filter { $0.isLetter || $0.isNumber }
    let length = cleanString.count
    let mid = length / 2
    
    for i in 0..<mid {
        let startIdx = cleanString.index(cleanString.startIndex, offsetBy: i)
        let endIdx = cleanString.index(cleanString.endIndex, offsetBy: -i - 1)
        
        if cleanString[startIdx] != cleanString[endIdx] {
            return false
        }
    }
    
    return true
}

let str = "Rotor"


print("Is '\(str)' a palindrome? \(isPalindrome(str))")



// 4.

func squareNumber(_ number: Int) -> Int {
    return number * number
}

let number = 25
let squaredNumber = squareNumber(number)

print(squaredNumber)
  

// .5


func countSimillarWords(_ input: String) -> [String: Int] {
    let words = input.lowercased().split { !$0.isLetter && !$0.isNumber }.map {String($0) }
    var wordFreq = [String: Int]()
    
    for word in words {
        if !word.isEmpty {
            wordFreq[word, default: 0] += 1
        }
    }
    return wordFreq
}


let inputString = "It seems like a weekend but it is not a weekend remember?"
let wordFreq = countSimillarWords(inputString)


print(wordFreq)


// 6.

let decimalToBinary: (Int) -> String = {
    Decimal in
    var binaryStr = ""
    var num = Decimal
    
    if num == 0 {
        return "0"
    }
    
    
    while num > 0 {
        let binaryNum = num % 2
        binaryStr = String(binaryNum) + binaryStr
        num = num / 2
    }
    
    return binaryStr
}

let decimalNumber = 25
let binaryNumber = decimalToBinary(decimalNumber)

print(binaryNumber)


// 7.

let ages = [17, 32, 41 ,54 ,61 ,72 ,33 , 22, 24, 25]
let evenNumbers = ages.filter { $0 % 2 == 0}

print("evenNumbers: \(evenNumbers) ")


// 8.

let list = [2, 5, 7, 8]
let multList = list.map { $0 * 10 }

print(multList)


// 9.


typealias CompletionHandler = () -> Void

func printSumAfter(_ array: [Int], delayInSeconds: Double, completion: @escaping CompletionHandler) {
    DispatchQueue.global().asyncAfter(deadline: .now() + delayInSeconds) {
        let sum = array.reduce(0, +)
        print("Sum of elements, \(sum)")
        completion()
    }

}

let numbers = [3, 5, 7, 9]

print("Calculating sum after 3 seconds...")
printSumAfter(numbers, delayInSeconds: 3.0) {
    print("Calculation is Completed")
}



// 10.

func filterOddNum(_ strArray: [String]) -> [Int] {
    let intArray = strArray.compactMap { Int($0) }
    let oddNumbers = intArray.filter { $0 % 2 != 0 }
    return oddNumbers
}

let strArray = ["20", "40", "25", "44", "33", "50", "11", "17"]


let oddNumbersArray = filterOddNum(strArray)

print("Odd numbers array: \(oddNumbersArray)")



