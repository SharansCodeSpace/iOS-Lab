//IOS LAB ASSIGNMENT 1

//Problem 1
let pi=3.14159;
var radius=5.0;
var circumference=2*pi*radius;
print("Circumference of the circle is \(circumference)")

//Problem 2
let birthyear=202;
var currentyear=2025;
var age=currentyear-birthyear;
print("The age is \(age)")

//Problem 3
var Marks=48;
Marks=Marks+1;
let outOfMarks=50;

//Problem 4
var score=0;
print("Score is \(score)")
score=score+2;
print("Score is \(score) which can change when using var")

//Problem 5
var currenttemp:Double=5;
var freezingpoint:Double=0;

//Problem 6
var Age:Int=21;
var height:Double=168.5;
print("Age is \(Age) and Height is \(height)")

//Problem 7
var firstDecimal=10.5;
var secondDecimal=2.4;

//Problem 8
var TrueorFalse=true;
print("Swift is a type safe language")

//Problem 9
var str="Hola";
print("Swift is a type safe language")

//Problem 10
var whole=5;
print("Swift is a type safe language and hear whole and firstDecimal both have different datatypes i.e Int and Double respectively")

//Problem 11
var name:String;
print("We cant use a variable before Initializing")

//Problem 12
var distanceTravelled:Double=0;
distanceTravelled=54.3;

//Problem 13 and 14
var  percentCompleted:Double=0;
percentCompleted=34.67;

//Problem 15
print("Enter your Name")
if let Name = readLine() {
    print("Hello \(Name)!")
} else {
    print("No name is entered here.")
}


//Problem 16
print("Enter the first number:")
if let num1 = readLine(), let number1 = Int(num1) {
    print("Enter the second number:")
    if let num2 = readLine(), let number2 = Int(num2) {
        let sum = number1 + number2
        print("The sum of two numbers is \(sum)")
    } else {
        print(" No input is taken here for the second number.")
    }
} else {
    print("No input is taken here for the first number.")
    print("No input is taken here for the second number.")

}

//Problem 17
print("Enter the temperature in Celsius:")
if let num = readLine(), let celsius = Int(num) {
    let fahrenheit = (celsius * 9/5) + 32
    print("The temperature in Fahrenheit is \(fahrenheit)")
} else {
    print("No input is taken here for Celsius.")
}

