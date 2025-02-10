//IOS ASSIGNMENT 2

import Foundation

// 1. Addition, Subtraction, Multiplication, and Division
let num1 = 10
let num2 = 5

let addition = num1 + num2
let subtraction = num1 - num2
let multiplication = num1 * num2
let division = num1 / num2

print("1. Addition: \(addition)")
print("1. Subtraction: \(subtraction)")
print("1. Multiplication: \(multiplication)")
print("1. Division: \(division)")

// 2. Compound Assignment Operators
var number = 10

number += 5  // Add 5 to the variable
print("2. After addition: \(number)")

number -= 3  // Subtract 3 from the variable
print("2. After subtraction: \(number)")

number *= 2  // Multiply the variable by 2
print("2. After multiplication: \(number)")

number /= 4  // Divide the variable by 4
print("2. After division: \(number)")

// 3. Operator Precedence
let X = 5
let Y = 3
let Z = 2

let result1 = X + Y * Z
let result2 = (X + Y) * Z

print("3. Result of (X + Y * Z): \(result1)")
print("3. Result of ((X + Y) * Z): \(result2)")

// 4. Convert Int to Double and perform multiplication
let intValue = 10
let doubleValue = Double(intValue)
let result = doubleValue * 2.5
print("4. Multiplication result as Double: \(result)")

// 5. Convert Double to Int and return the integer part
let doubleValue2 = 10.75
let intValue2 = Int(doubleValue2)
print("5. Integer part of the Double: \(intValue2)")

// 6. Even or odd
let number2 = 7

if number2 % 2 == 0 {
    print("6. \(number2) is even")
} else {
    print("6. \(number2) is odd")
}

// 7. Classify score into grades
let score = 85

if score >= 90 {
    print("7. Grade: A")
} else if score >= 80 {
    print("7. Grade: B")
} else if score >= 70 {
    print("7. Grade: C")
} else if score >= 60 {
    print("7. Grade: D")
} else {
    print("7. Grade: F")
}

// 8. Match username and password
let username = "user123"
let password = "password123"

let inputUsername = "user123"
let inputPassword = "password1253"

if inputUsername == username && inputPassword == password {
    print("8. Login Successful!")
} else {
    print("8. Invalid username or password.")
}

// 9. Switch statement for days of the week
let dayNumber = 3

switch dayNumber {
case 1:
    print("9. Monday")
case 2:
    print("9. Tuesday")
case 3:
    print("9. Wednesday")
case 4:
    print("9. Thursday")
case 5:
    print("9. Friday")
case 6:
    print("9. Saturday")
case 7:
    print("9. Sunday")
default:
    print("9. Invalid day number")
}

// 10. Find the largest of three integers
let num3 = 15
let num4 = 25
let num5 = 20

if num3 >= num4 && num3 >= num5 {
    print("10. The largest number is \(num3)")
} else if num4 >= num3 && num4 >= num5 {
    print("10. The largest number is \(num4)")
} else {
    print("10. The largest number is \(num5)")
}

// 11. Check eligibility to vote
let age = 20
let isCitizen = true

if age >= 18 && isCitizen {
    print("11. You are eligible to vote.")
} else {
    print("11. You are not eligible to vote.")
}

// 12. Check eligibility for a discount
let isStudent = true
let isSeniorCitizen = false

if isStudent || isSeniorCitizen {
    print("12. You are eligible for a discount.")
} else {
    print("12. You are not eligible for a discount.")
}

// 13. Print values of constants
let number6 = 1000
let isSmallNumber = number6 < 10
let speedLimit = 65
let currentSpeed = 72
let isSpeeding = currentSpeed > speedLimit

print("13. isSmallNumber: \(isSmallNumber), isSpeeding: \(isSpeeding)")

// Type of constants
print("13. Type of isSmallNumber: \(type(of: isSmallNumber))")
print("13. Type of isSpeeding: \(type(of: isSpeeding))")

// 14. Classify age using range cases
let age2 = 25

switch age2 {
case 0..<13:
    print("14. Child")
case 13..<20:
    print("14. Teenager")
case 20..<60:
    print("14. Adult")
default:
    print("14. Senior")
}

// 15. Classify if it's a weekday or weekend
let day = "Saturday"

switch day {
case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday":
    print("15. \(day) is a weekday.")
case "Saturday", "Sunday":
    print("15. \(day) is a weekend.")
default:
    print("15. Invalid day")
}
