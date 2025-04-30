import UIKit

// 1. Imagine you want to write a function to calculate the area of a rectangle. However, if you pass a negative number into the function, you don't want it to calculate a negative area. Create a function called `calculateArea` that takes two `Double` parameters, `x` and `y`, and returns an optional `Double`. Write a guard statement at the beginning of the function that verifies each of the parameters is greater than zero and returns `nil` if not. When the guard has succeeded, calculate the area by multiplying `x` and `y` together, then return the area. Call the function once with positive numbers and once with negative number.

func calculateArea(x: Double, y: Double) -> Double? {
    guard x > 0, y > 0 else {
        return nil
    }
    return x * y
}
print(calculateArea(x: 5, y: 10) ?? "Invalid input")
print(calculateArea(x: -5, y: 10) ?? "Invalid input")

// 2. Create a function called `add` that takes two optional integers as parameters and returns an optional integer. You should use one `guard` statement to unwrap both optional parameters, returning `nil` in the `guard` body if one or both of the parameters doesn't have a value. If both parameters can successfully be unwrapped, return their sum. Call the function once with non-`nil` numbers and once with at least one parameter being `nil`.

func add(_ a: Int?, _ b: Int?) -> Int? {
    guard let a = a, let b = b else {
        return nil
    }
    return a + b
}
print(add(4, 5) ?? "Invalid input")
print(add(nil, 5) ?? "Invalid input")

// 3. Write a function below the given code called `createUser` that takes no parameters and returns an optional `User` object. Write a guard statement at the beginning of the function that unwraps the values of each text field's `text` property, and returns `nil` if not all values are successfully unwrapped. After the guard statement, use the unwrapped values to create and return an instance of `User`.

struct UserForm {
    var firstName: String
    var lastName: String
    var age: String
}

let firstNameTextField = UITextField()
let lastNameTextField = UITextField()
let ageTextField = UITextField()

firstNameTextField.text = "Jonathan"
lastNameTextField.text = "Sanders"
ageTextField.text = "28"

func createUser() -> UserForm? {
    guard let firstName = firstNameTextField.text,
          let lastName = lastNameTextField.text,
          let age = ageTextField.text else {
        return nil
    }
    return UserForm(firstName: firstName, lastName: lastName, age: age)
}

// 4. Call the function you made above and capture the return value. Unwrap the `User` with standard optional binding and print a statement using each of its properties.

if let user = createUser() {
    print("User: \(user.firstName) \(user.lastName), Age: \(user.age)")
} else {
    print("Failed to create user.")
}

// 5. In the exercises on optionals, you created a failable initializer for a `Workout` struct that would only initialize a `Workout` object if the `startTime` and `endTime` were further apart than 10 seconds. You'll now create the same failable initializer, only using a guard statement to check that the start and end times aren't too close together.

// 6. Create a `Workout` struct that has properties `startTime` and `endTime` of type `Double`.

struct Workout {
    var startTime: Double
    var endTime: Double

    // 7. Write a failable initializer that takes parameters for your start and end times, and then checks to see if they are greater than 10 seconds apart using a guard statement. If they are, your initializer should fail. Otherwise, the initializer should set the properties accordingly.
    init?(startTime: Double, endTime: Double) {
        guard endTime - startTime > 10 else {
            return nil
        }
        self.startTime = startTime
        self.endTime = endTime
    }
}

// 8. Imagine a screen where a user inputs a meal that they've eaten. If the user taps a "save" button without adding any food, you might want to prompt the user that they haven't actually added anything. Using the `Food` struct and the text fields provided below, create a function called `logFood` that takes no parameters and returns an optional `Food` object. Inside the body of the function, use a guard statement to unwrap the `text` property of `foodTextField` and `caloriesTextField`. In addition to unwrapping `caloriesTextField`, you'll need to create and unwrap a new variable that initializes an `Int` from the text in `caloriesTextField`. If any of this fails, return `nil`. After the guard statement, create and return a `Food` object.

struct Food {
    var name: String
    var calories: Int
}

let foodTextField = UITextField()
let caloriesTextField = UITextField()

foodTextField.text = "Banana"
caloriesTextField.text = "23"

func logFood() -> Food? {
    guard let name = foodTextField.text,
          let calorieText = caloriesTextField.text,
          let calories = Int(calorieText) else {
        return nil
    }
    return Food(name: name, calories: calories)
}

// 9. Call the function you made above and capture the return value. Unwrap the `Food` object with standard optional binding and print a statement about the food using each of its properties. Go back and change the text in `caloriesTextField` to a string that cannot be converted into a number. What happens in that case?

if let food = logFood() {
    print("Food: \(food.name), Calories: \(food.calories)")
} else {
    print("Invalid food input.")
}

caloriesTextField.text = "abc"
if let food = logFood() {
    print("Food: \(food.name), Calories: \(food.calories)")
} else {
    print("Invalid food input.")
}

// 10. Using a comment or print statement, describe why the code below will generate a compiler error if you uncomment //print statement.

for _ in 0..<10 {
    let foo = 55
    print("The value of foo is \(foo)")
}
// print("The value of foo is \(foo)")

// The compiler error occurs because `foo` is defined inside the for-loop block scope and is not accessible outside of it.

// 11. Using a comment or print statement, describe why both print statements below compile when similar-looking code did not compile above. In what scope is `x` defined, and in what scope is it modified? In contrast, in what scope is `foo` defined and used?

var x = 10
for _ in 0..<10 {
    x += 1
    print("The value of x is \(x)")
}
print("The final value of x is \(x)")

// `x` is defined in the outer scope (outside the loop) and modified inside the loop, so it remains accessible both inside and outside the loop.
// `foo`, in the previous example, was declared inside the loop and thus is not accessible outside.

// 12. In the body of the function `greeting` below, use variable shadowing when unwrapping `greeting`. If `greeting` is successfully unwrapped, print a statement that uses the given greeting to greet the given name. Otherwise, use "Hello" to print a statement greeting the given name. Call the function twice, once passing in a value for greeting, and once passing in `nil`.

func greeting(greeting: String?, name: String) {
    if let greeting = greeting {
        print("\(greeting), \(name).")
    } else {
        print("Hello, \(name).")
    }
}

greeting(greeting: "Hi there", name: "Sara")
greeting(greeting: nil, name: "John")

// 13. Create a class called `Car`. It should have properties for `make`, `model`, and `year` that are of type `String`, `String`, and `Int`, respectively. Since this is a class, you'll need to write your own memberwise initializer. Use shadowing when naming parameters in your initializer.

class Car {
    var make: String
    var model: String
    var year: Int

    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
}

// 14. Below is a `User` struct and three `User` instances. These will be used throughout the exercises below to simulate competition in the fitness tracking app.

struct User {
    var name: String
    var stepsToday: Int
}

// instances
let stepMaster = User(name: "StepMaster", stepsToday: 8394)
let activeSitter = User(name: "ActiveSitter", stepsToday: 9132)
let monsterWalker = User(name: "MonsterWalker", stepsToday: 7193)

let competitors = [stepMaster, activeSitter, monsterWalker]

// 15. Corrected getWinner function
func getWinner(competitors: [User]) -> User? {
    var topCompetitor: User?

    for competitor in competitors {
        if let currentTop = topCompetitor {
            if competitor.stepsToday > currentTop.stepsToday {
                topCompetitor = competitor
            }
        } else {
            topCompetitor = competitor
        }
    }
    return topCompetitor
}

if let winner = getWinner(competitors: competitors) {
    print("Winner: \(winner.name)")
}

// 15. Fix the compiler error below and call `getWinner(competitors:)`, passing in the array `competitors`. Print the `name` property of the returned `User` object.

func getWinner(competitors: [User]) -> User? {
    var topCompetitor: User?

    for competitor in competitors {
        if let currentTop = topCompetitor {
            if competitor.stepsToday > currentTop.stepsToday {
                topCompetitor = competitor
            }
        } else {
            topCompetitor = competitor
        }
    }
    return topCompetitor
}

if let winner = getWinner(competitors: competitors) {
    print("Winner: \(winner.name)")
}

// 16. Write a memberwise initializer inside the `User` struct above that uses variable shadowing for naming the parameters of the initializer.

extension User {
    init?(name: String, stepsToday: Int) {
        self.name = name
        self.stepsToday = stepsToday
    }
}

// 17. Now write a failable initializer inside the `User` struct above that takes parameters `name` and `stepsToday` as an optional `String` and `Int`, respectively. The initializer should return `nil` if either of the parameters are `nil`. Use variable shadowing when unwrapping the two parameters.

extension User {
    init?(name: String?, stepsToday: Int?) {
        guard let name = name, let stepsToday = stepsToday else {
            return nil
        }
        self.name = name
        self.stepsToday = stepsToday
    }
}

// 18. Define a `Suit` enum with four possible cases: `clubs`, `spades`, `diamonds`, and `hearts`.

enum Suit {
    case clubs
    case spades
    case diamonds
    case hearts
}

// 19. Imagine you are being shown a card trick and have to draw a card and remember the suit. Create a variable instance of `Suit` called `cardInHand` and assign it to the `hearts` case. Print out the instance.

var cardInHand = Suit.hearts
print("Card in hand: \(cardInHand)")

// 20. Now imagine you have to put back the card you drew and draw a different card. Update the variable to be a spade instead of a heart.

cardInHand = .spades
print("Card in hand after change: \(cardInHand)")

// 21. Imagine you are writing an app that will display a fun fortune based on cards drawn. Write a function called `getFortune(cardSuit:)` that takes a parameter of type `Suit`. Inside the body of the function, write a switch statement based on the value of `cardSuit`. Print a different fortune for each `Suit` value. Call the function a few times, passing in different values for `cardSuit` each time.

func getFortune(cardSuit: Suit) {
    switch cardSuit {
    case .clubs:
        print("A new opportunity will soon appear.")
    case .spades:
        print("Be cautious of unexpected challenges.")
    case .diamonds:
        print("Wealth and success are in your future.")
    case .hearts:
        print("Love and joy are coming your way.")
    }
}

getFortune(cardSuit: .clubs)
getFortune(cardSuit: .spades)
getFortune(cardSuit: .diamonds)
getFortune(cardSuit: .hearts)

// 22. Create a `Card` struct below. It should have two properties, one for `suit` of type `Suit` and another for `value` of type `Int`.

struct Card {
    var suit: Suit
    var value: Value

    // 23. Inside the struct above, create an enum for `Value`. It should have cases for `ace`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`, `jack`, `queen`, `king`. Change the type of `value` from `Int` to `Value`.
    enum Value {
        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
}

let firstCard = Card(suit: .hearts, value: .queen)
let secondCard = Card(suit: .spades, value: .ace)

print("First card: \(firstCard.value) of \(firstCard.suit)")
print("Second card: \(secondCard.value) of \(secondCard.suit)")
