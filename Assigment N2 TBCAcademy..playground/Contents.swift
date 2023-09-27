import UIKit

var greeting = "Hello, playground"



// 1.

var number1 = 15
var number2 = 8

print(number1 + number2)


// 2.

print("\n")

let tockasAge = 24

if tockasAge > 10 && tockasAge <= 20 {
    print("\(tockasAge) is more than 10 and less or equal to 20.")
} else if tockasAge > 20 && tockasAge <= 50 {
    print("\(tockasAge) is more than 20 and less or equal to 50.")
} else if tockasAge > 50 && tockasAge <= 100 {
    print("\(tockasAge) is more than 50 and less or equal to 100.")
} else if tockasAge > 100 {
    print("\(tockasAge) is more than 100.")
} else {
    print("\(tockasAge) is less than or equal to 10.")
}





// 3.

print("\n")

for number in 1...20 {
    print("\(number) ", terminator: "")
}

    


// 4.

print("\n")

var number = 1
var sumOfOddNumbers = 0

while number <= 100 {
    if number % 2 != 0 {
        sumOfOddNumbers += number
    }
    number += 1
}

print("Sum of all odd numbers from 1 to 100 is: \(sumOfOddNumbers)")


// 5.

print("\n")


var originalString = "hidroElektroSadguri"
var reversedString = ""

for char in originalString {
    reversedString = String(char) + reversedString
}

print("Reversed string: \(reversedString)")




// 6.

print("\n")

for i in 11...99 where i % 11 == 0 {
    print("\(i) ", terminator: "")
}



// 7.

print("\n")

var sworiNumber = "123456789"
var shebrunebuliNumber = ""

for char in sworiNumber.reversed() {
    shebrunebuliNumber.append(char)
}

print("shebrunebuliNumber: \(shebrunebuliNumber)")


// 8.

print("\n")

var isNumberFound = false
var firstNumber = 1

while !isNumberFound {
    if firstNumber % 5 == 0 && firstNumber % 9 == 0 {
        isNumberFound = true
        print("First number divisible by 5 and 9 is: \(firstNumber)")
    }
    firstNumber += 1
}


// 9.

print("\n")


let month = "october"

switch month {
case "november":
    print("winter is comming")
case "august":
    print("still time for vacation")
case "october":
    print("it is yellow autumn")
case "february":
    print("still cold outside")
default:
    print("Fallen Leaves")
}


// 10.

print("\n")


var counter = 0

while true {
    switch counter % 3 {
    case 0:
        print("🔴", terminator: "")
    case 1:
        print("🟡", terminator: "")
    case 2:
        print("🟢", terminator: "")
    default:
        break
    }
    
    counter += 1
}
