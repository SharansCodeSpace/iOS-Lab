// Assignment 4 - String and Functions
// By 23520011 - Sharaneshwar Punjal

import Foundation

// 1. Declare two variables: name = "Alice" and age = 25. Print a sentence using string interpolation. Expected Output: "Alice is 25 years old."
let name = "Alice"
let age = 25
print("\(name) is \(age) years old.")

// 2. Declare two numbers: num1 = 10 and num2 = 5. Print "The sum of 10 and 5 is 15" using string interpolation.
let num1 = 10
let num2 = 5
let sum = num1 + num2
print("The sum of \(num1) and \(num2) is \(sum)")

// 3. Declare a string variable and find its length. Print the result.
let sampleString = "Hello, Swift!"
print("The length of '\(sampleString)' is \(sampleString.count)")

// 4. Take a string, convert it to uppercase and lowercase, and print both results.
let mixedCaseString = "Swift Programming"
print("Uppercase: \(mixedCaseString.uppercased())")
print("Lowercase: \(mixedCaseString.lowercased())")

// 5. Declare a string and check if it is empty. Print "String is empty" if true; otherwise, print "String is not empty".
let emptyString = ""
if emptyString.isEmpty {
    print("String is empty")
} else {
    print("String is not empty")
}

// 6. Given two string variables, concatenate them using the + operator and print the result.
let firstPart = "Hello, "
let secondPart = "World!"
let concatenated = firstPart + secondPart
print("Concatenated string: \(concatenated)")

// 7. Given word = "SwiftLanguage", check if it starts with "Swift" and print true or false.
let word = "SwiftLanguage"
print("Does '\(word)' start with 'Swift'? \(word.hasPrefix("Swift"))")

// 8. Given website = "www.example.com", extract the domain extension (".com") using suffix.
let website = "www.example.com"
if let dotIndex = website.lastIndex(of: ".") {
    let domainExtension = website[dotIndex...]
    print("Domain extension: \(domainExtension)")
} else {
    print("No domain extension found")
}

// 9. Given text = "The quick brown fox", check if "brown" is present. Print true or false.
let text = "The quick brown fox"
print("Does the text contain 'brown'? \(text.contains("brown"))")

// 10. Given str1 = "Hello" and str2 = "hello", check if they are equal (case-sensitive) and print the result.
let str1 = "Hello"
let str2 = "hello"
print("Are '\(str1)' and '\(str2)' equal (case-sensitive)? \(str1 == str2)")

// 11. Given str1 = "Hello" and str2 = "hello", check if they are equal ignoring case and print the result.
print("Are '\(str1)' and '\(str2)' equal (ignoring case)? \(str1.lowercased() == str2.lowercased())")

// 12. Write a function isWeekend() that returns true if today is Saturday or Sunday, otherwise false.
func isWeekend() -> Bool {
    // Using the current calendar and date
    let today = Calendar.current.component(.weekday, from: Date())
    // In the Gregorian calendar: Sunday is 1 and Saturday is 7.
    return today == 1 || today == 7
}
print("Is it weekend? \(isWeekend())")

// 13. Write a function isEven(number: Int) -> Bool that returns true if the number is even, otherwise false.
func isEven(number: Int) -> Bool {
    return number % 2 == 0
}
print("Is 4 even? \(isEven(number: 4))")
print("Is 7 even? \(isEven(number: 7))")

// 14. Write a function celsiusToFahrenheit(celsius: Double) -> Double that converts Celsius to Fahrenheit. Formula: F = C * 9/5 + 32
func celsiusToFahrenheit(celsius: Double) -> Double {
    return celsius * 9/5 + 32
}
print("25°C in Fahrenheit: \(celsiusToFahrenheit(celsius: 25))")

// 15. Write a function power(base: Int, exponent: Int = 2) -> Int that returns base^exponent. The exponent defaults to 2 if not provided.
func power(base: Int, exponent: Int = 2) -> Int {
    var result = 1
    for _ in 1...exponent {
        result *= base
    }
    return result
}
print("2^3 = \(power(base: 2, exponent: 3))")
print("3^2 (default exponent) = \(power(base: 3))")

// 16. Write a function calculateArea(of length: Double, and width: Double) -> Double that returns the area of a rectangle when called as calculateArea(of: 10, and: 5).
func calculateArea(of length: Double, and width: Double) -> Double {
    return length * width
}
print("Area of rectangle (10 x 5): \(calculateArea(of: 10, and: 5))")

// 17. Write a function greet(person name: String) that prints "Hello, <name>!". Called as greet(person: "Alice")
func greet(person name: String) {
    print("Hello, \(name)!")
}
greet(person: "Alice")

// 18. Write a function repeatMessage(_ message: String, _ times: Int) that prints the message multiple times. Called as repeatMessage("Swift", 3)
func repeatMessage(_ message: String, _ times: Int) {
    for _ in 1...times {
        print(message)
    }
}
repeatMessage("Swift", 3)

// 19. Write a function maxOfTwo(a: Int, b: Int) -> Int that returns the larger of the two numbers. Example: maxOfTwo(a: 8, b: 12) should output 12.
func maxOfTwo(a: Int, b: Int) -> Int {
    return a > b ? a : b
}
print("Max of 8 and 12: \(maxOfTwo(a: 8, b: 12))")

// 20. Write a function factorial(n: Int) -> Int that returns the factorial of n. Example: factorial(n: 5) should output 120.

// Iterative Function
func factorialIterative(n: Int) -> Int {
    if n < 0 {
        return 0
    }
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}

// Recursive Function
func factorial(n: Int) -> Int {
    if n < 0 {
        return 0
    }
    return n == 0 ? 1 : n * factorial(n: n - 1)
}
print("Factorial of 5: \(factorial(n: 5))")
print("Iterative Factorial of 5: \(factorialIterative(n: 5))")
