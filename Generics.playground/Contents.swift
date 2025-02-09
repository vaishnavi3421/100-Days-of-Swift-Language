import UIKit

//Generic Function
func swapfunc<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}
var x = 10 , y = 20
swapfunc(a: &x, b: &y)
print(x,y)

// Generic Struct
struct Stack<T> {
    private var element: [T] = []
    
    mutating func push(_ item: T){
        element.append(item)
    }
    mutating func pop() -> T? {
           return element.popLast()
        }
}
    var intStack = Stack<Int>()
    intStack.push(5)
    intStack.push(10)
    intStack.push(4)
    intStack.push(54)
    print(intStack.pop()!)

//Generic Protocol

protocol Identifiable {
    var id: Int { get }
}

struct User: Identifiable {
    var id: Int
}

struct Book: Identifiable {
    var id: Int  // This works, but what if we want String IDs?
}

protocol Identifiable1 {
    associatedtype ID: Equatable  // ID must conform to Equatable
    var id: ID { get }
}

struct Product: Identifiable1 {
    var id: UUID  // UUID conforms to Equatable
}

//Generic Function – Reusable Sorting Function


















