// MARK: - Handling missing data
/*
 We’ve used types such as Int to hold values like 5. But if you wanted to store an age property for users, what would you do if you didn’t know someone’s age?
 
 Swift’s solution is called optionals, and you can make optionals out of any type. An optional integer might have a number like 0 or 40, but it might have no value at all – it might literally be missing, which is nil in Swift.
 */
var age: Int? = nil
age = 38

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-optionals
/*
 Any data type can be optional in Swift:

 An integer might be 0, -1, 500, or any other range of numbers.
 An optional integer might be all the regular integer values, but also might be nil – it might not exist.
 A string might be “Hello”, it might be the complete works of Shakespeare, or it might be “” – an empty string.
 An optional string might be any regular string value, but also might be nil.
 A custom User struct could contain all sorts of properties that describe a user.
 An optional User struct could contain all those same properties, or not exist at all.
 
 */
// MARK: - Unwrapping optionals
var name: String? = nil

/*
 What happens if we use name.count? A real string has a count property that stores how many letters it has, but this is nil – it’s empty memory, not a string, so it doesn’t have a count.

 Because of this, trying to read name.count is unsafe and Swift won’t allow it. Instead, we must look inside the optional and see what’s there – a process known as unwrapping.
 */

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}
// why does swift make us unwrap optionals?
func getUsername() -> String? {
    "Taylor"
}

if let username = getUsername() {
    print("Username is \(username).")
} else {
    print("username does not exist.")
}
// MARK: - Unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name")
        return
    }
    print("Hello, \(unwrapped)")
}
// when to usee rather than if let
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-to-use-guard-let-rather-than-if-let

func getMeaningofLife() -> Int? {
    42
}
func printmeaningLife() {
    if let name = getMeaningofLife() {
        print(name)
    }
}
/*
 That uses if let, so that the result of getMeaningOfLife() will only be printed if it returned an integer rather than nil.

 If we had written that using guard let, it would look like this:
 */
func printMeaningLife() {
    guard let name = getMeaningofLife() else {
        return
    }
    print(name)
}
/*
  It lets us focus on the “happy path” – the behavior of our function when everything has gone to plan, which is to print the meaning of life.
 guard requires that we exit the current scope when it’s used, which in this case means we must return from the function if it fails. This is not optional: Swift won’t compile our code without the return.
 */
/*
 It’s common to see guard used one or more times at the start of methods, because it’s used to verify conditions are correct up front. This makes our code easier to read than if we tried to check a condition then run some code, then check another condition and run some different code.

 So, use if let if you just want to unwrap some optionals, but prefer guard let if you’re specifically checking that conditions are correct before continuing.
 */
// MARK: - Force unwrapping
let str = "5"
let num = Int(str)!

/*
 Swift will immediately unwrap the optional and make num a regular Int rather than an Int?. But if you’re wrong – if str was something that couldn’t be converted to an integer – your code will crash.

 As a result, you should force unwrap only when you’re sure it’s safe – there’s a reason it’s often called the crash operator.
 */
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-force-unwrap-optionals-in-swift
// you should never force unwrap something that won’t succeed 100% of the time. That’s it – that’s the entire rule.
// MARK: - Implicitly unwrapped optionals

let age1: Int! = nil

/*
 Because they behave as if they were already unwrapped, you don’t need if let or guard let to use implicitly unwrapped optionals. However, if you try to use them and they have no value – if they are nil – your code crashes.
 
 Implicitly unwrapped optionals exist because sometimes a variable will start life as nil, but will always have a value before you need to use it. Because you know they will have a value by the time you need them, it’s helpful not having to write if let all the time.
 
 That being said, if you’re able to use regular optionals instead it’s generally a good idea.
 */

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-need-both-implicitly-unwrapped-optionals-and-regular-optionals
