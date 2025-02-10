import Foundation

// Assignment No. 5 - Structures
// By 23520011 - Sharaneshwar Punjal


// 1. Define a Book structure with properties: title (String), author (String), price (Double), and yearPublished (Int). Create an instance of Book and display its details using function displayBook().
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
    print("Year Published: \(book.yearPublished)")
}

let book1 = Book(title: "Swift Programming", author: "Apple", price: 999, yearPublished: 2020)
displayBook(book1)


// 2. Create a Rectangle structure with properties width and height. Add a function calcArea() to calculate the area of the rectangle.
struct Rectangle {
    var width: Double
    var height: Double
    
    func calcArea() -> Double {
        return width * height
    }
}

let rect = Rectangle(width: 10, height: 5)
print("\n-------------------------------------------------\n")
print("Area of rectangle: \(rect.calcArea())")


// 3. Create a Temperature structure that has a property celsius (Double). Add an initializer that takes Fahrenheit and converts it to Celsius.
struct Temperature {
    var celsius: Double
    
    init(fahrenheit: Double) {
        self.celsius = (fahrenheit - 32) * 5 / 9
    }
}

let temp = Temperature(fahrenheit: 98.6)
print("\n-------------------------------------------------\n")
print("Temperature in Celsius: \(temp.celsius)")


// 4. Define a Student structure with properties name, rollNumber, and marks. Provide a custom initializer that assigns default values.
struct Student {
    var name: String
    var rollNumber: Int
    var marks: Double
    
    init(name: String = "Unknown", rollNumber: Int = 0, marks: Double = 0.0) {
        self.name = name
        self.rollNumber = rollNumber
        self.marks = marks
    }
}

let student1 = Student()
let student2 = Student(name: "Sharan", rollNumber: 101, marks: 85.5)
print("\n-------------------------------------------------\n")
print("Student1: \(student1.name), Roll: \(student1.rollNumber), Marks: \(student1.marks)")
print("Student2: \(student2.name), Roll: \(student2.rollNumber), Marks: \(student2.marks)")

// 5. Define a Smartphone structure with properties: brand (String), model (String), storageGB (Int), price (Double). Use the memberwise initializer to create an instance of Smartphone and print its specifications.
struct Smartphone {
    var brand: String
    var model: String
    var storageGB: Int
    var price: Double
}

let phone = Smartphone(brand: "Apple", model: "iPhone 14", storageGB: 128, price: 60000.00)
print("\n-------------------------------------------------\n")
print("Smartphone: \(phone.brand) \(phone.model), Storage: \(phone.storageGB)GB, Price: ₹\(phone.price)")

// 6. Create a struct BankAccount with properties: accountHolder (String) and balance (Double). Add a custom initializer that ensures a minimum balance of ₹500. If the provided balance is lower, set it to ₹500.
struct BankAccount {
    var accountHolder: String
    var balance: Double
    
    init(accountHolder: String, balance: Double) {
        self.accountHolder = accountHolder
        self.balance = balance < 500 ? 500 : balance
    }
}

let account1 = BankAccount(accountHolder: "Sharaneshwar Punjal", balance: 300)
let account2 = BankAccount(accountHolder: "Ram Varma", balance: 1000)
print("\n-------------------------------------------------\n")
print("Account Holder: \(account1.accountHolder), Balance: ₹\(account1.balance)")
print("Account Holder: \(account2.accountHolder), Balance: ₹\(account2.balance)")

// 7. Create a struct CarDetails with properties: brand (String), model (String), year (Int). Provide a custom initializer where if no year is provided, it defaults to the current year.
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
            self.year = Calendar.current.component(.year, from: Date())
        }
    }
}

let car1 = CarDetails(brand: "Toyota", model: "Camry", year: 2020)
let car2 = CarDetails(brand: "Honda", model: "Civic")
print("\n-------------------------------------------------\n")
print("Car1: \(car1.brand) \(car1.model), Year: \(car1.year)")
print("Car2: \(car2.brand) \(car2.model), Year: \(car2.year)")

// 8 & 9. Define a struct BankAccount with instance methods deposit(amount:) and withdraw(amount:) as mutating methods. The deposit method increases the balance, and the withdraw method deducts the amount only if there are sufficient funds.
struct BankAccountMutating {
    var accountHolder: String
    var balance: Double
    
    mutating func deposit(amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
        } else {
            print("Insufficient funds for withdrawal.")
        }
    }
}

var myAccount = BankAccountMutating(accountHolder: "Sharan", balance: 1000)
print("\n-------------------------------------------------\n")
myAccount.deposit(amount: 500)
print("After deposit, Balance: ₹\(myAccount.balance)")
myAccount.withdraw(amount: 300)
print("After withdrawal, Balance: ₹\(myAccount.balance)")
myAccount.withdraw(amount: 1500)

// 10. Define a struct Car with properties: fuelLevel (Double: percentage between 0 and 100) and mileage (Double). Add mutating methods: refuel(amount:) to increase fuelLevel (not exceeding 100%), and drive(distance:) to decrease fuelLevel based on mileage.
struct Car {
    var fuelLevel: Double
    var mileage: Double
    
    mutating func refuel(amount: Double) {
        fuelLevel += amount
        if fuelLevel > 100 {
            fuelLevel = 100
        }
    }
    
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
print("\n-------------------------------------------------\n")
myCar.refuel(amount: 30)
print("Fuel level after refuel: \(myCar.fuelLevel)%")
myCar.drive(distance: 60)  // Consumes 60 * 0.5 = 30 units of fuel.
print("Fuel level after driving: \(myCar.fuelLevel)%")

// 11. Define a struct Employee with properties: name (String) and basicSalary (Double). Add a computed property netSalary (Double) that returns the salary after a 10% tax deduction.
struct Employee {
    var name: String
    var basicSalary: Double
    
    var netSalary: Double {
        return basicSalary * 0.90
    }
}

let employee1 = Employee(name: "Mark", basicSalary: 50000)
print("\n-------------------------------------------------\n")
print("Employee: \(employee1.name), Net Salary: ₹\(employee1.netSalary)")

// 12. Define a struct Speed with property metersPerSecond (Double). Add computed properties: kmPerHour (metersPerSecond * 3.6) and milesPerHour (metersPerSecond * 2.237).
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
print("\n-------------------------------------------------\n")
print("Speed: \(speedInstance.metersPerSecond) m/s, \(speedInstance.kmPerHour) km/h, \(speedInstance.milesPerHour) mph")

// 13. Define a struct CarSpeed with property: speed (Double). Use property observers: willSet to display the current and upcoming speed, and didSet to print a warning if the speed exceeds 120 km/h.
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
print("\n-------------------------------------------------\n")
myCarSpeed.speed = 110
myCarSpeed.speed = 130

// 14. Create a copy of structure CarSpeed using another instance and display the details.
let copyCarSpeed = myCarSpeed
print("\n-------------------------------------------------\n")
print("Copied CarSpeed: \(copyCarSpeed.speed) km/h")

// 15. Define a struct Circle with property: radius (Double). Add a type property pi (Double) = 3.14159 and a type method area(radius:) that calculates and returns the area using the formula: pi * radius^2. Call the method without creating an instance.
struct Circle {
    var radius: Double
    static let pi: Double = 3.14159
    
    static func area(radius: Double) -> Double {
        return pi * radius * radius
    }
}

print("\n-------------------------------------------------\n")
print("Area of circle with radius 5: \(Circle.area(radius: 5))")

// 16. Define a struct Customer with properties: name (String) and id (Int). Use an initializer to set the properties using 'self'. Create an instance and display details.
struct Customer {
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

let customer1 = Customer(name: "Alice", id: 1001)
print("\n-------------------------------------------------\n")
print("Customer: \(customer1.name), ID: \(customer1.id)")
