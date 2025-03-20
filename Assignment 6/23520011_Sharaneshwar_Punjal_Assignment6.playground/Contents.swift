// Assignment No. 6
// Name - Sharaneshwar Bharat Punjal
// PRN - 23520011
// Title - (Class, Inheritance, Collection and Loops)

import Foundation

// 1. Create a class Car with properties: brand, model, and year.
//    Add an initializer to set these properties.
//    Create an object and print the car details.

class Car {
    var brand: String
    var model: String
    var year: Int

    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
    var carAge: Int {
        let currentYear = Calendar.current.component(.year, from: Date())
        return currentYear - year
    }

    func displayDetails() {
        print("Brand: \(brand), Model: \(model), Year: \(year), Age: \(carAge) years")
    }
}

let car1 = Car(brand: "Toyota", model: "Corolla", year: 2019)
print("\n-------------------------------------------------\n")
print("Car Details:")
print("Brand: \(car1.brand)")
print("Model: \(car1.model)")
print("Year: \(car1.year)")

// 2. Modify the above Car class to include a method displayDetails() that prints all details of the car.
//    Call this method for an instance.
//    Add a computed property carAge that calculates the car’s age based on the current year.

print("\n-------------------------------------------------\n")
print("Car Details using displayDetails() method:")
car1.displayDetails()

// 3. Create a subclass ElectricCar that inherits from Car.
//    Add a new property batteryCapacity.
//    Override the displayDetails() method to include battery capacity.

class ElectricCar: Car {
    var batteryCapacity: Int

    init(brand: String, model: String, year: Int, batteryCapacity: Int) {
        self.batteryCapacity = batteryCapacity
        super.init(brand: brand, model: model, year: year)
    }

    override func displayDetails() {
        print("Brand: \(brand), Model: \(model), Year: \(year), Age: \(carAge) years, Battery Capacity: \(batteryCapacity) kWh")
    }
}
let tesla = ElectricCar(brand: "Tesla", model: "Model S", year: 2022, batteryCapacity: 100)
print("\n-------------------------------------------------\n")
tesla.displayDetails()

// 4. Create a class Animal with properties name and age. Provide a designated initializer for this class.
//    Create a subclass Dog that inherits from Animal. Override the initializer in the Dog class to also initialize a new property breed.
//    Test the class by creating an instance of Dog with all three properties: name, age, and breed.

class Animal {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Dog: Animal {
    var breed: String

    init(name: String, age: Int, breed: String) {
        self.breed = breed
        super.init(name: name, age: age)
    }
}
let dog = Dog(name: "Buddy", age: 5, breed: "Golden Retriever")
print("\n-------------------------------------------------\n")
print("Dog Name: \(dog.name), Age: \(dog.age), Breed: \(dog.breed)")

// 5. Create a class Laptop with properties brand, processor, and ramSize. Add a designated initializer to this class.
//    Create a subclass GamingLaptop that inherits from Laptop. Override the initializer to include an additional property graphicsCard and provide a default value for ramSize.
//    Create an instance of GamingLaptop and print all its properties.

class Laptop {
    var brand: String
    var processor: String
    var ramSize: Int

    init(brand: String, processor: String, ramSize: Int) {
        self.brand = brand
        self.processor = processor
        self.ramSize = ramSize
    }
}

class GamingLaptop: Laptop {
    var graphicsCard: String

    init(brand: String, processor: String, graphicsCard: String, ramSize: Int = 16) {
        self.graphicsCard = graphicsCard
        super.init(brand: brand, processor: processor, ramSize: ramSize)
    }
}
let gamingLaptop = GamingLaptop(brand: "Asus", processor: "Intel i7", graphicsCard: "RTX 3070")
print("\n-------------------------------------------------\n")
print("Brand: \(gamingLaptop.brand), Processor: \(gamingLaptop.processor), RAM: \(gamingLaptop.ramSize)GB, Graphics Card: \(gamingLaptop.graphicsCard)")

// 6. Create an array of integers as var numbers = [1, -3, 50, 72, -95, 115]
//    Identify whether 72 and 95 are part of the array or not. Print the result.

var numbers = [1, -3, 50, 72, -95, 115]
print("\n-------------------------------------------------\n")
print("72 is in the array: \(numbers.contains(72))")
print("95 is in the array: \(numbers.contains(95))")

// 7. Create myArray of 20 elements with default value as 0, Display myArray elements.

var myArray = Array(repeating: 0, count: 20)
print("\n-------------------------------------------------\n")
print(myArray)

// 8. Create an array fruits which contains names of fruits. Identify whether the array is empty or not.
//    If not then find the number of elements present in the array. Print the result.

var fruits = ["Apple", "Banana", "Mango"]
print("\n-------------------------------------------------\n")
print("Array is empty: \(fruits.isEmpty)")
print("Number of elements: \(fruits.count)")

// 9. Create an array var cricketers = ["Sachine", "Rahul", "Rohit", "Virat"]
//    Update "Sachine" with "Yuvraj", Add "Shubhaman" using append method
//    Add ["Ravindra", "Hardik"] using + operator, Insert "Suresh" at position 5
//    Remove name at position 4, Remove last cricketer, Display cricketers

var cricketers = ["Sachin", "Rahul", "Rohit", "Virat"]
print("\n-------------------------------------------------\n")
cricketers[0] = "Yuvraj"
print(cricketers)
cricketers.append("Shubhman")
print(cricketers)
cricketers += ["Ravindra", "Hardik"]
print(cricketers)
cricketers.insert("Suresh", at: 5)
print(cricketers)
cricketers.remove(at: 4)
print(cricketers)
cricketers.removeLast()
print(cricketers)

// 10. Create a nameAge array which contain array of cricketers and array of ages.
//     Display name and age of First cricketer in array.

let nameAge = [["Virat", "Rohit"], [35, 36]]
print("\n-------------------------------------------------\n")
print("Name: \(nameAge[0][0]), Age: \(nameAge[1][0])")

// 11. Create a dictionary var scores = ["Sachine": 50000, "Hardik": 4000, "Ravindra": 8000] and display details.

var scores = ["Sachin": 50000, "Hardik": 4000, "Ravindra": 8000]
print("\n-------------------------------------------------\n")
print(scores)

// 12. Add "Virat" with 25000 and Update score of Hardik to 9000 also display old score of Hardik.

let oldScore = scores["Hardik"]
scores["Virat"] = 25000
scores["Hardik"] = 9000
print("\n-------------------------------------------------\n")
print("Old score of Hardik: \(oldScore ?? 0)")
print(scores)

// 13. Remove Sachine from the dictionary and print his score at the time of deletion then print the remaining elements.

let removedScore = scores.removeValue(forKey: "Sachin")
print("\n-------------------------------------------------\n")
print("Removed Sachin's score: \(removedScore ?? 0)")
print(scores)

// 14. Create two separate arrays from this dictionary and display the details.

let keys = Array(scores.keys)
let values = Array(scores.values)
print("\n-------------------------------------------------\n")
print("Keys: \(keys)")
print("Values: \(values)")

// 15. Create an array of strings containing the names of 5 cities.
//     Write a for loop to print each city name on a new line.

let cities = ["Mumbai", "Delhi", "Chennai", "Kolkata", "Pune"]
print("\n-------------------------------------------------\n")
for city in cities {
    print(city)
}

// 16. Write a for loop to calculate the factorial of a given number.

let num = 5
var factorial = 1
for i in 1...num {
    factorial *= i
}
print("\n-------------------------------------------------\n")
print("Factorial of \(num) is \(factorial)")

// 17. Create dictionary let vehicles = ["unicycle": 1, "bicycle": 2, "tricycle": 3, "quad bike": 4]
//     using for loop display message as vehicle – has – wheels.

let vehicles = ["unicycle": 1, "bicycle": 2, "tricycle": 3, "quad bike": 4]
print("\n-------------------------------------------------\n")
for (vehicle, wheels) in vehicles {
    print("\(vehicle) - has - \(wheels) wheels")
}

// 18. Write a while loop that checks if a given number is prime.

var primeNum = 29
var isPrime = true
var i = 2
while i * i <= primeNum {
    if primeNum % i == 0 {
        isPrime = false
        break
    }
    i += 1
}
print("\n-------------------------------------------------\n")
if isPrime {
    print("\(primeNum) is a prime number")
} else {
    print("\(primeNum) is not a prime number")
}

// 19. Write a while loop to reverse a given integer.

var number = 1234
var reversed = 0
while number > 0 {
    let digit = number % 10
    reversed = reversed * 10 + digit
    number /= 10
}
print("\n-------------------------------------------------\n")
print("Original number: \(number)")
print("Reversed number: \(reversed)")

// 20. Write a while loop that checks if a given number is an Armstrong number.

var armstrongNum = 1634
var temp = armstrongNum
var sum = 0
let digits = String(armstrongNum).count
while temp > 0 {
    let digit = temp % 10
    sum += Int(pow(Double(digit), Double(digits)))
    temp /= 10
}
print("\n-------------------------------------------------\n")
if sum == armstrongNum {
    print("\(armstrongNum) is Armstrong number")
} else {
    print("\(armstrongNum) is Not Armstrong number")
}
