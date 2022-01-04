// MARK: - Closures with multiple parameters

//func travel(action: (String, Int) -> String){
//    print("I'm getting ready to go")
//    let description = action("london", 40)
//    print(description)
//    print("I arrived")
//}
//travel {"I'm going to \($0) at \($1) miles per hour."}
// MARK: - Returning closures from functions
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result = travel()
result("London")
// not recommended but technically allowed
let result2 = travel()("London")

// Swift comes with a built-in random number generator
print(Int.random(in: 1...10))

// If we wanted to write a function that returned one random number between 1 and 10, we would write this:
func randomNumberGenerator() -> Int {
    return Int.random(in: 1...10)
}
print(randomNumberGenerator())
// let's go further
func randomNumberGenerator_1() -> () -> Int {
    let function = { Int.random(in: 1...10) }
    return function
}
let generator = randomNumberGenerator_1()
let random1 = generator()
print(random1)
// MARK: - Capturing values
func travel1() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter)I'm going to \($0)")
        counter += 1
    }
}
let result1 = travel1()
result1("London")
result1("London")
result1("London")
result1("London")
// why capture?
func randomNumberGenerator_2() -> () -> Int {
    var previousNumber = 0
    return {
        var newNumber: Int
        
        repeat {
            newNumber = Int.random(in: 1...10)
        } while newNumber == previousNumber
        previousNumber = newNumber
        return newNumber
    }
}
let generator1 = randomNumberGenerator_2()
for _ in 1...10 {
    print(generator1())
}
// https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-swifts-closures-capture-values

// MARK: - Summary
/*
 You can assign closures to variables, then call them later on.

 Closures can accept parameters and return values, like regular functions.

 You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.

 If the last parameter to your function is a closure, you can use trailing closure syntax.

 Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.

 If you use external values inside your closures, they will be captured so the closure can refer to them later.
 */
