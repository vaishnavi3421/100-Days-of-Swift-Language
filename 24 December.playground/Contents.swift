import UIKit
import Foundation

/*** Data types (Strings, Arrays, Dictionaries, Sets, Tuples)
 * Control Flow (If-else, Switch, Guard, Loops)
 * Functions (Parameter passing, closures, return types, inout)**/

/**
 String :- %.2f
 Array :- offset by ,
 sorted(by:) : The sorted(by:) method returns a new array with elements sorted based on the closure you provide.
 let sortedArray = array.sorted { (a, b) -> Bool in
     // custom comparison logic 
 }
 sort(by:) method sorts the array in place, meaning it modifies the original array.
 
 function :- pass by value
 pass by reference
 inout
 */
//#String
let price = 10.5
let date = Date()

let message = "The price is $\(String(format: "%.2f", price)) and the date is \(date)."
print(message)

let prices = 19.9
let formattedPrice = String(format: "%.2f", prices)
print(formattedPrice)  // Output: "19.90"
//%.2f: Means "floating-point number with exactly 2 digits after the decimal".

//#Array
// Hello World!
var greeting = "Hello"
greeting.append(", World")
//greeting.insert("!", at: greeting.index(greeting.startIndex, offsetBy: -12))

// offset by
let str = "Hello World"
let index = str.index(str.startIndex, offsetBy: 4)
print(index)

let arr:[Int] = [12,65,3,6,234,89]
let OffsetIndex = arr.index(arr.startIndex, offsetBy: 2)
print(OffsetIndex)

//sorting of Array
// in decending order
let nos = [2,6,1,6,34,9,34,23]
let sortedArray = nos.sorted { $0 > $1 }
print(sortedArray)
// sorting Array by length
let array = ["apple", "banana", "kiwi", "grape", "pineapple"]
let sortedWords = array.sorted { $0.count < $1.count }
print(sortedWords)
// sort(by:) ;- method sorts the array in place, meaning it modifies the original array.
var numbers = [5, 3, 8, 1, 2]
numbers.sort { $0 < $1 }
print(numbers)
var fruits = ["apple", "banana", "cherry", "date"]
fruits.sort { $0 > $1 }
print(fruits)
//Let's say you have a custom struct Person and you want to sort an array of Person objects by their age.
struct Person{
    let name: String
    let age: Int
}
let arrayOfPerson = [
    Person(name: "Vaishnavi", age: 25),
    Person(name: "Rachana", age: 27),
    Person(name: "Prem", age: 25),
    Person(name: "Om", age: 56),
    Person(name: "Ram", age: 4)
]
let sorted = arrayOfPerson.sorted {$0.age < $1.age}
for i in sorted {
    print("Persons name\(i.name), age: \(i.age)")
}
//For example, if you want to sort a list of people by age first, and then by name if ages are equal.
let sortbyName = arrayOfPerson.sorted {
if $0.age == $1.age {
    return $0.name < $1.name
}
return $0.age < $1.age
}
for i in sortbyName {
    print(" name is \(i.name), and age is \(i.age)")
}
// sorting by computed Value
// In the decending order print Name and Price but on price we have 10 percent discount
struct Item {
    let name: String
    let price: Double
    
// COMPUTE PROPERTY
var discountPrice: Double {
    return price * 0.9
 }
}
let arrayOfItem = [
    Item(name: "vaishu", price: 76),
    Item(name: "rani" , price: 65),
    Item(name: "pratik", price: 34)
]
let sortedItemList = arrayOfItem.sorted { $0.discountPrice < $1.discountPrice}
for item in sortedItemList {
    print("Name \(item.name) Age \(item.price)")
}
// Function Parameter :-

        

