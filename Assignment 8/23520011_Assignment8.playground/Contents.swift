// Assignment No 8 - Optionals
// 23520011 - Sharaneshwar Punjal
// Date: 07/04/25

import Foundation

// 1. Declare an optional Int variable named score and assign it a value of nil. Then, later assign it a value of 90.
var score: Int? = nil
score = 90

// 2. What will happen if you force unwrap an optional that is nil? Try it in a Swift playground.
// It will cause a runtime crash: "Fatal error: Unexpectedly found nil while unwrapping an Optional value."
// var number: Int? = nil
// print(number!)

// 3. Write a function that takes an optional String and prints its value if it is not nil. Otherwise, print "No value".
func printOptionalString(_ text: String?) {
    if let unwrappedText = text {
        print(unwrappedText)
    } else {
        print("No value")
    }
}
printOptionalString("Hello, Swift!")
printOptionalString(nil)

// 4. Write a function that takes an optional Double and returns half of its value. If nil, return 0.0.
func half(of number: Double?) -> Double {
    return number != nil ? number! / 2 : 0.0
}
print(half(of: 20.0))
print(half(of: nil))

// 5. Use optional binding (if let) to safely unwrap an optional integer and print its value.
var optionalInt: Int? = 42
if let value = optionalInt {
    print("The value is \(value)")
} else {
    print("No value")
}

// 6. Define a class Book with an optional property author: String?. Create an instance of Book and use optional chaining to print the author's name if available.
class Book {
    var author: String?
}
let myBook = Book()
myBook.author = "Yashwant Kulkarni"
if let authorName = myBook.author {
    print("Author: \(authorName)")
} else {
    print("Author not available")
}

// 7. Write a function that takes an optional dictionary [String: Int]? and returns the value of a given key. If the dictionary is nil or the key does not exist, return -1.
func getValue(for key: String, in dictionary: [String: Int]?) -> Int {
    return dictionary?[key] ?? -1
}
let sampleDict: [String: Int]? = ["one": 1, "two": 2]
print(getValue(for: "one", in: sampleDict))
print(getValue(for: "three", in: sampleDict))
print(getValue(for: "one", in: nil))

// 8. Implement a function that takes an optional sentence (String?) and returns the first word if available. Otherwise, return "No words".
func firstWord(in sentence: String?) -> String {
    return sentence?.components(separatedBy: " ").first ?? "No words"
}
print(firstWord(in: "Swift is awesome"))
print(firstWord(in: nil))

// 9. Create a struct User with an optional property email: String?. Write a method inside the struct to return a valid email or "No email provided".
struct User {
    var email: String?
    
    func getEmail() -> String {
        return email ?? "No email provided"
    }
}
let userWithEmail = User(email: "user@example.com")
print(userWithEmail.getEmail())

let userWithoutEmail = User(email: nil)
print(userWithoutEmail.getEmail())

// 10. Implement a BankAccount class with a property balance: Double. The initializer should return nil if the initial balance is negative.
class BankAccount {
    var balance: Double
    
    init?(initialBalance: Double) {
        if initialBalance < 0 {
            return nil
        }
        self.balance = initialBalance
    }
}
let validAccount = BankAccount(initialBalance: 100.0)
print(validAccount?.balance ?? 0.0)

let invalidAccount = BankAccount(initialBalance: -50.0)
print(invalidAccount?.balance ?? 0.0)

// 11. Implement a User struct that only allows usernames with at least 5 characters. If a shorter username is given, return nil.
struct ValidUser {
    var username: String
    
    init?(username: String) {
        if username.count < 5 {
            return nil
        }
        self.username = username
    }
}
let user1 = ValidUser(username: "Swift")
print(user1?.username ?? "Invalid username")

let user2 = ValidUser(username: "Hi")
print(user2?.username ?? "Invalid username")
