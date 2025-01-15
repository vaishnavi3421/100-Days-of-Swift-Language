import UIKit

/**
 Day 1-3: Core Swift Fundamentals
 * Data types (Strings, Arrays, Dictionaries, Sets, Tuples)
 * Control Flow (If-else, Switch, Guard, Loops)
 * Functions (Parameter passing, closures, return types, inout)
 * Optionals (Optional binding, Optional chaining, Nil-Coalescing)
 * Error Handling (try, throw, do-catch)
 * Protocols and Delegation (Understanding protocols, default protocol methods, delegate pattern)
 Resources:
 * Apple Swift documentation
 * Swift Playgrounds (for hands-on practice)
 * Book: Swift Programming: The Big Nerd Ranch Guide
 Day 4-5: Advanced Swift Concepts
 * Memory Management (ARC, strong/weak/unowned references)
 * Generics (Understanding and using generics in functions and types)
 * Closures (Capture lists, escaping vs non-escaping)
 * Concurrency (GCD, DispatchQueue, Async/Await)
 * SwiftUI (Declarative syntax, state management, environment objects)
 Resources:
 * Swift.org
 * Book: Advanced Swift by Chris Eidhof and Ole Begemann
 Day 6-7: Practice coding exercises on Swift
 * Solve problems using Swift on LeetCode or HackerRank.
 * Focus on problems involving strings, arrays, and algorithms.
 */

//***********************************************************
// Data types( Strings, Arrays, Dictionaries, Sets, Tuples )

// Array
// Creating an array of integers
var numbers = [1, 2, 3, 4, 5]

// Accessing elements by index
let firstNumber = numbers[0]  // 1
let lastNumber = numbers[numbers.count - 1]  // 5
let SecondLastNumber = numbers[numbers.count - 2]
// Adding an element
numbers.append(6)  // [1, 2, 3, 4, 5, 6]

// Inserting an element at a specific index
numbers.insert(0, at: 0)  // [0, 1, 2, 3, 4, 5, 6]

// Iterating over the array
for i in numbers {
    print(i)  // Prints each element in the array
}

// Removing an element by index
numbers.remove(at: 2)  // Removes the element at index 2, [0, 1, 3, 4, 5, 6]

// Check if array is empty
let isEmpty = numbers.isEmpty  // false
print(isEmpty)

//Dictionary
// Creating a dictionary
var person = ["name": "John", "age": "30", "city": "New York"]

// Accessing a value by key
let name = person["name"]  // "John"

// Adding a new key-value pair
person["job"] = "Developer"  // ["name": "John", "age": "30", "city": "New York", "job": "Developer"]

// Modifying an existing value
person["age"] = "31"  // ["name": "John", "age": "31", "city": "New York", "job": "Developer"]

// Iterating through the dictionary
for (key, value) in person {
    print("\(key): \(value)")  // Prints each key-value pair
}

// Removing a key-value pair
person.removeValue(forKey: "city")  // Removes the key "city"

// Check if key exists
let hasJobKey = person.keys.contains("job")  // true


let age = 20
let hasTicket = true

if age >= 18 && hasTicket {
    print("You can enter the concert.")
} else if age < 18 {
    print("You're too young to enter.")
} else {
    print("You need a ticket to enter.")
}
// Output: "You can enter the concert."

