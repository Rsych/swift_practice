//func printHelp() {
//    let message = """
//Welcome to My App!
//elfjalefjlsifjsliefjalsfij
//"""
//    print(message)
//}
//printHelp()
//
// MARK: - Accepting param
//
//func square(number: Int) {
//    print(number * number)
//}
//
//square(number: 5)
//
// MARK: - Returning values
//func square_return(number: Int) -> Int {
//    return number * number
//}
//let result = square_return(number: 5)
//print(result)

// MARK: - Parameter labels
//
//func square(number: Int) -> Int {
//    return number * number
//}
//let result = square(number: 8)
//func sayHello(xx name: String) {
//    print("Hello, \(name)")
//}
//sayHello(xx: "Taylor")
//
// MARK: - Omitting param labels
//
//func greet(_ person: String) {
//    print("hello, \(person)")
//}
//greet("Taylor")


// MARK: - Default parameters

//func greet(_ person: String, nicely: Bool = true) {
//    if nicely == true {
//        print("hello, \(person)")
//    } else {
//        print("Oh no, it's \(person) again...")
//    }
//}
//greet("Taylor")
//greet("Taylor", nicely: false)

// MARK: - Variadic functions

//func square(numbers: Int...) {
//    for number in numbers {
//        print("\(number) squared is \(number * number)")
//    }
//}
//square(numbers: 1, 2, 3, 4, 5)
//// https://www.hackingwithswift.com/quick-start/understanding-swift/when-to-use-variadic-functions

// MARK: - Writing throwing functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password"{
        throw PasswordError.obvious
    }
    return true
}

// MARK: - Running throwing functions

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password")
}
 // https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-make-us-use-try-before-every-throwing-function

// MARK: - inout parameters

func doubleInPlace(number: inout Int) {
    number *= 2
}

var mynum = 10
doubleInPlace(number: &mynum)

// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-inout-parameters

// MARK: - Summary
/*
 Functions let us re-use code without repeating ourselves.
 Functions can accept parameters – just tell Swift the type of each parameter.
 Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
 You can use different names for parameters externally and internally, or omit the external name entirely.
 Parameters can have default values, which helps you write less code when specific values are common.
 Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
 Functions can throw errors, but you must call them using try and handle errors using catch.
 You can use inout to change variables inside a function, but it’s usually better to return a new value.
 */
