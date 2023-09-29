import UIKit

var greeting = "Hello, playground"


// 1.

var ages = [12, 33, 25, 43, 64]
if ages.count >= 2 {
    let elements = ages[0]
    ages[0] = ages[ages.count - 1]
    ages[ages.count - 1] = elements
}
print(ages)



// 2.

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.removeAll(where: { $0 % 2 == 0 })
print(numbers)


// 3.

var originalArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var evenArray: [Int] = []
var oddArray: [Int] = []

for number  in originalArray {
    if number % 2 == 0 {
        evenArray.append(number)
    } else {
        oddArray.append(number)
    }
}

print("Even Numbers array: \(evenArray)")
print("Odd Numbers Array: \(oddArray)")



// 4.

var array = [3.8, 4.77, 4.66, 2.45, 3.1]

var largestinDoubles = array[0]
for largestNumber in array {
    if largestNumber > largestNumber {
        largestinDoubles = largestNumber
    }
}

print("The largest number in array is : \(largestinDoubles)")


// 5.

var firstlist = [8, 4, 9, 9, 0, 2]
var secondlist = [1, 0, 9, 2, 3, 7, 0, 1]

var mergedArray = firstlist + secondlist

let n = mergedArray.count
var swapped: Bool

repeat {swapped = false
    for i in 1..<n {
        if mergedArray[i - 1 ] > mergedArray[i] {
            let temp = mergedArray[i - 1]
            mergedArray[i - 1] = mergedArray[i]
            mergedArray[i] = temp
            swapped = true
        }
    }
} while swapped
            
print("sorted merged array: \(mergedArray)")


// 6.

let inputString = "abcda"
var charSet = Set<Character>()

for char in inputString {
    if charSet.contains(char) {
        print("Not all characters are unique")
    }
    charSet.insert(char)
}

if charSet.count == inputString.count{
    print("every character in a string are unique")
}


// 7.

var listOne: Set = [1, 5, 6, 7, 10, 44, 56, 24, 67]
var listTwo: Set = [3, 4, 7, 10, 44, 55, 23, 61]

// Intersect
let intersect = listOne.intersection(listTwo)

// subtract / difference
let pullOutDifference = listOne.subtracting(listTwo)

// Union
listOne.union(listTwo)


// 8.

var proffession: Set = ["IOS Developer", "Android Developer", "Backend Developer", "Frontend Developer"]
var typeOfWork: Set = ["Mobile applications", "Web Development"]

typeOfWork.isSubset(of: proffession)


// 9.


var proffessions: Set<String> = [
    "IOS Developer",
    "Android Developer",
    "Backend Developer",
    "Frontend Developer",
    "IOS Developer"
]

var allproffessions = Set<Character>()

for proffessions in proffessions {
    let lowercaseProffesion = proffessions.lowercased()
    allproffessions.formUnion(lowercaseProffesion)
}

let areAllProffessionsUnique = allproffessions.count == proffessions.reduce(0) { $0 + $1.count}

if areAllProffessionsUnique {
    print("Every name proffession in this array are different")
} else {
    print("This array Includes same names of proffessions")
}


// 10.

let movies: [String: Double] = [
    "Interstellar" : 8.7,
    "A Space Odyssey" : 8.3,
    "Dune 2021" : 8.0,
    "Avatar 2009" : 7.9,
    "Inception" : 8.8,
    "The Matrix 1999" : 8.7,
    "Guardians Of The Galaxy" : 8.0
]

var totalIMDbScore: Double = 0.0
let amountOfScore = Double(movies.count)

for score in movies.values {
    totalIMDbScore += score
}

let averageScore = totalIMDbScore / amountOfScore

print("Average IMBd Score of Movies is: \(averageScore)")
