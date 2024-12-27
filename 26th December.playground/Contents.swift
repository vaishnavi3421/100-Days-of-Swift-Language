import UIKit
/**
 * Functions (Parameter passing, closures, return types, inout)
 * Protocols and Delegation (Understanding protocols, default protocol methods, delegate pattern)
 * Closures (Capture lists, escaping vs non-escaping)
 
 */
//**************************************************************************
/**
 function:-
 1 ] function Parameter Passing in Swift
 a]  By Value (Default Behavior)
 b] By Reference using inout
 c] Multiple inout Parameters
 
 */

//a]  By Value (Default Behavior)
// no. incrementation
func increment(value:Int) -> Int {
    var newValue = value
    newValue += 1
    return value
}
var number = 5
let incrementNumber = increment(value: number)
print("orignal no. \(number)")
print("new Value \(incrementNumber)")

// passing a string
func appendExclamation(to string: String) -> String {
    return string + "!"
}
var value = "Hello World"
let final_Value = appendExclamation(to: value)
print(" value 1 \(value)")
print("value 2 \(final_Value)")

// Closure
// simple closure
let addno: (Int , Int) -> Int =  { a, b in
    return a + b
}
let result = addno(2 ,3 )
print(result)

// closure passed an function argument
func calculate(_ operation: (Int,Int) -> Int, x:Int, y:Int) -> Int {
    return operation(x,y)
}
let product = calculate({a,b in return a * b}, x: 3, y: 4)
print(product)

// Sorting an array using closure
let num = [23,56,87,34,23,65,34]
//let sortedArray = num.sorted()
//print(sortedArray)
let sortedArray = num.sorted() { (a,b) -> Bool in
    return a < b
}
print(sortedArray)
