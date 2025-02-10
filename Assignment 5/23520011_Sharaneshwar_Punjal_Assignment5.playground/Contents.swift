import Foundation

// Assignment No. 5 - Structures
// By 23520011 - Sharaneshwar Punjal

// 1. Define a Book structure with properties: title (String), author (String), price (Double),
//    and yearPublished (Int). Create an instance of Book and display its details using function displayBook().
struct Book {
    var title: String
    var author: String
    var price: Double
    var yearPublished: Int
}

func displayBook(_ book: Book) {
    print("\n-----Book Details-----")
    print("Title: \(book.title)")
    print("Author: \(book.author)")
    print("Price: ₹\(book.price)")
    print("Year Published: \(book.yearPublished)\n")
}

let book1 = Book(title: "Swift Programming", author: "Apple", price: 999, yearPublished: 2020)
displayBook(book1)

// 2. Create a Rectangle structure with properties width and height.
//    Add a function calcArea() to calculate the area of the rectangle.
struct Rectangle {
    var width: Double
    var height: Double
    
    func calcArea() -> Double {
        return width * height
    }
}

let rect = Rectangle(width: 10, height: 5)
print("Area of rectangle: \(rect.calcArea())\n")

// 3. Create a Temperature structure that has a property celsius (Double).
//    Add an initializer that takes Fahrenheit and converts it to Celsius.
struct Temperature {
    var celsius: Double
    
    // Convert Fahrenheit to Celsius: (F - 32) * 5/9
    init(fahrenheit: Double) {
        self.celsius = (fahrenheit - 32) * 5 / 9
    }
}

let temp = Temperature(fahrenheit: 98.6)
print("---- Task 3: Temperature Conversion ----")
print("Temperature in Celsius: \(temp.celsius)")
print("\n")

// 4. Define a Student structure with properties name, rollNumber, and marks.
//    Provide a custom initializer that assigns default values.
struct Student {
    var name: String
    var rollNumber: Int
    var marks: Double
    
    // Custom initializer with default values.
    init(name: String = "Unknown", rollNumber: Int = 0, marks: Double = 0.0) {
        self.name = name
        self.rollNumber = rollNumber
        self.marks = marks
    }
}

let student1 = Student()
let student2 = Student(name: "Bob", rollNumber: 101, marks: 85.5)
print("---- Task 4: Student Details ----")
print("Student1: \(student1.name), Roll: \(student1.rollNumber), Marks: \(student1.marks)")
print("Student2: \(student2.name), Roll: \(student2.rollNumber), Marks: \(student2.marks)")
print("\n")

// 5. Define a Smartphone structure with properties: brand (String), model (String),
//    storageGB (Int), price (Double). Use the memberwise initializer to create an instance
//    of Smartphone and print its specifications.
struct Smartphone {
    var brand: String
    var model: String
    var storageGB: Int
    var price: Double
}

let phone = Smartphone(brand: "Apple", model: "iPhone 14", storageGB: 128, price: 999.99)
print("---- Task 5: Smartphone Specifications ----")
print("Smartphone: \(phone.brand) \(phone.model), Storage: \(phone.storageGB)GB, Price: ₹\(phone.price)")
print("\n")

// 6. Create a struct BankAccount with properties: accountHolder (String) and balance (Double).
//    Add a custom initializer that ensures a minimum balance of ₹500. If the provided balance
//    is lower, set it to ₹500.
struct BankAccount {
    var accountHolder: String
    var balance: Double
    
    init(accountHolder: String, balance: Double) {
        self.accountHolder = accountHolder
        self.balance = balance < 500 ? 500 : balance
    }
}

let account1 = BankAccount(accountHolder: "John Doe", balance: 300)
let account2 = BankAccount(accountHolder: "Jane Doe", balance: 1000)
print("---- Task 6: BankAccount Initialization ----")
print("Account Holder: \(account1.accountHolder), Balance: ₹\(account1.balance)")
print("Account Holder: \(account2.accountHolder), Balance: ₹\(account2.balance)")
print("\n")

// 7. Create a struct CarDetails with properties: brand (String), model (String), year (Int).
//    Provide a custom initializer where if no year is provided, it defaults to the current year.
struct CarDetails {
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int? = nil) {
        self.brand = brand
        self.model = model
        if let providedYear = year {
            self.year = providedYear
        } else {
            // Default to current year
            self.year = Calendar.current.component(.year, from: Date())
        }
    }
}

let car1 = CarDetails(brand: "Toyota", model: "Camry", year: 2020)
let car2 = CarDetails(brand: "Honda", model: "Civic")
print("---- Task 7: Car Details ----")
print("Car1: \(car1.brand) \(car1.model), Year: \(car1.year)")
print("Car2: \(car2.brand) \(car2.model), Year: \(car2.year)")
print("\n")

// 8 & 9. Define a struct BankAccount with instance methods deposit(amount:) and withdraw(amount:)
//    as mutating methods. The deposit method increases the balance, and the withdraw method deducts
//    the amount only if there are sufficient funds.
struct BankAccountMutating {
    var accountHolder: String
    var balance: Double
    
    // Increase balance by the specified amount.
    mutating func deposit(amount: Double) {
        balance += amount
    }
    
    // Decrease balance if funds are sufficient.
    mutating func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
        } else {
            print("Insufficient funds for withdrawal.")
        }
    }
}

var myAccount = BankAccountMutating(accountHolder: "Alice", balance: 1000)
print("---- Task 8 & 9: BankAccount Mutating Methods ----")
myAccount.deposit(amount: 500)
print("After deposit, Balance: ₹\(myAccount.balance)")
myAccount.withdraw(amount: 300)
print("After withdrawal, Balance: ₹\(myAccount.balance)")
myAccount.withdraw(amount: 1500)  // Should display insufficient funds
print("\n")

// 10. Define a struct Car with properties: fuelLevel (Double: percentage between 0 and 100)
//     and mileage (Double). Add mutating methods: refuel(amount:) to increase fuelLevel
//     (not exceeding 100%), and drive(distance:) to decrease fuelLevel based on mileage.
struct Car {
    var fuelLevel: Double  // percentage value from 0 to 100
    var mileage: Double    // fuel consumption rate per unit distance
    
    // Increases fuel level without exceeding 100%.
    mutating func refuel(amount: Double) {
        fuelLevel += amount
        if fuelLevel > 100 {
            fuelLevel = 100
        }
    }
    
    // Decreases fuel level based on the distance driven and mileage.
    mutating func drive(distance: Double) {
        let fuelConsumed = distance * mileage
        if fuelLevel >= fuelConsumed {
            fuelLevel -= fuelConsumed
        } else {
            print("Not enough fuel to drive \(distance) units.")
        }
    }
}

var myCar = Car(fuelLevel: 50, mileage: 0.5)
print("---- Task 10: Car Fuel Simulation ----")
myCar.refuel(amount: 30)
print("Fuel level after refuel: \(myCar.fuelLevel)%")
myCar.drive(distance: 60)  // Consumes 60 * 0.5 = 30 units of fuel.
print("Fuel level after driving: \(myCar.fuelLevel)%")
print("\n")

// 11. Define a struct Employee with properties: name (String) and basicSalary (Double).
//     Add a computed property netSalary (Double) that returns the salary after a 10% tax deduction.
struct Employee {
    var name: String
    var basicSalary: Double
    
    var netSalary: Double {
        return basicSalary * 0.90  // Deduct 10% tax.
    }
}

let employee1 = Employee(name: "Mark", basicSalary: 50000)
print("---- Task 11: Employee Net Salary ----")
print("Employee: \(employee1.name), Net Salary: ₹\(employee1.netSalary)")
print("\n")

// 12. Define a struct Speed with property metersPerSecond (Double).
//     Add computed properties: kmPerHour (metersPerSecond * 3.6) and milesPerHour (metersPerSecond * 2.237).
struct Speed {
    var metersPerSecond: Double
    
    var kmPerHour: Double {
        return metersPerSecond * 3.6
    }
    
    var milesPerHour: Double {
        return metersPerSecond * 2.237
    }
}

let speedInstance = Speed(metersPerSecond: 10)
print("---- Task 12: Speed Conversion ----")
print("Speed: \(speedInstance.metersPerSecond) m/s, \(speedInstance.kmPerHour) km/h, \(speedInstance.milesPerHour) mph")
print("\n")

// 13. Define a struct CarSpeed with property: speed (Double).
//     Use property observers: willSet to display the current and upcoming speed,
//     and didSet to print a warning if the speed exceeds 120 km/h.
struct CarSpeed {
    var speed: Double {
        willSet {
            print("Changing speed from \(speed) km/h to \(newValue) km/h")
        }
        didSet {
            if speed > 120 {
                print("Warning: Speed exceeds 120 km/h!")
            }
        }
    }
}

var myCarSpeed = CarSpeed(speed: 100)
print("---- Task 13: CarSpeed with Property Observers ----")
myCarSpeed.speed = 110  // willSet and didSet will trigger
myCarSpeed.speed = 130  // Warning should be printed
print("\n")

// 14. Create a copy of structure CarSpeed using another instance and display the details.
let copyCarSpeed = myCarSpeed  // Value types are copied by default in Swift.
print("---- Task 14: Copy of CarSpeed ----")
print("Copied CarSpeed: \(copyCarSpeed.speed) km/h")
print("\n")

// 15. Define a struct Circle with property: radius (Double).
//     Add a type property pi (Double) = 3.14159 and a type method area(radius:)
//     that calculates and returns the area using the formula: pi * radius^2.
//     Call the method without creating an instance.
struct Circle {
    var radius: Double
    static let pi: Double = 3.14159
    
    static func area(radius: Double) -> Double {
        return pi * radius * radius
    }
}

print("---- Task 15: Circle Area Using Type Method ----")
print("Area of circle with radius 5: \(Circle.area(radius: 5))")
print("\n")

// 16. Define a struct Customer with properties: name (String) and id (Int).
//     Use an initializer to set the properties using 'self'. Create an instance and display details.
struct Customer {
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

let customer1 = Customer(name: "Alice", id: 1001)
print("---- Task 16: Customer Details ----")
print("Customer: \(customer1.name), ID: \(customer1.id)")
