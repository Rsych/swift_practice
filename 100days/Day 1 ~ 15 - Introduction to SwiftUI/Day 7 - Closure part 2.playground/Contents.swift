// MARK: - Using closures as param when they accept params

import Foundation

//func travel(action: (String) -> Void) {
//    print("I'm getting ready")
//    action("London")
//    print("I arrived")
//}
//
//travel { (place: String) in
//    print("I'm going to \(place) in my car")
//}
// When would closures with parameters be used as parameters?
//first we might write a closure like this one:
//let changeSpeed = { ( speed: Int) in
//    print("Changing speed to \(speed)")
//}
// And now we can create a buildCar() function that accepts any sort of closure for the engine, as long as that closure can be told to accelerate or decelerate to a specific integer value:
func buildCar(name: String, engine: (Int) -> Void) {
    // build car
}
// MARK: - Using closures as param when they return values
//func travel(action: (String) -> String) {
//    print("I'm getting ready to go.")
//    let description = action("london")
//    print(description)
//    print("I arrived")
//}
//travel { (place: String) -> String in
//    return "I'm going to \(place) in my car"
//}
// When would you use return param function
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-would-you-use-closures-with-return-values-as-parameters-to-a-function

func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
    // start with a total equal to the first value
    var current = values[0]
    
    // loop over all the values in the array, counting from index 1 onwards
    for value in values[1...] {
                current = closure(current, value)
}
 return current
}
let numbers = [10, 20, 30]
let sum = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal + next
}
print(sum)
// The great thing here is that reduce() doesn’t care what its closure does – it only cares that it will accept two integers and return one integer. So, we could multiply all the items in our array like this:
let multiply = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal * next
}
print(multiply)
// in swift's operators are actually functions. Therefore we can use this
let sum_1 = reduce(numbers, using: +)
// MARK: - Shorthand parameter names

func travel(action: (String) -> String) {
    print("I'm getting ready to go")
    let description = action("london")
    print(description)
    print("I arrived")
}
travel {"I'm going to \($0) in my car"}
