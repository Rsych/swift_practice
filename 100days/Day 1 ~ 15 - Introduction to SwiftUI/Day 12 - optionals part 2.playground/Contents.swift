// MARK: - Nil coalescing
func userName(for id: Int) -> String? {
    if id == 1 {
        return "Taylor"
    } else {
        return nil
    }
}
let user = userName(for: 15) ?? "Anonymous"
// when to use it?
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-nil-coalescing-in-swift
//let savedData = first() ?? second() ?? ""
let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0
// Dictionary offers different approach
let crusherScore1 = scores["Crusher", default: 0]

// MARK: - Optional chaining
let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()

let names2 = ["Vincent": "ban Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names2["Vincent"]?.first?.uppercased()
// https://www.hackingwithswift.com/quick-start/understanding-swift/why-is-optional-chaining-so-important
// MARK: - Optional try
enum PasswordError: Error {
case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

do {
    try checkPassword("password")
    print("That password is good")
} catch {
    print("you can't use that password")
}
/*
 That runs a throwing function, using do, try, and catch to handle errors gracefully.
 
 There are two alternatives to try, both of which will make more sense now that you understand optionals and force unwrapping.
 
 The first is try?, and changes throwing functions into functions that return an optional. If the function throws an error you’ll be sent nil as the result, otherwise you’ll get the return value wrapped as an optional.
 
 Using try? we can run checkPassword() like this:
 */

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("Oh..")
}
/*
 The other alternative is try!, which you can use when you know for sure that the function will not fail. If the function does throw an error, your code will crash.
 */
try! checkPassword("sekrit")
print("Ok")

// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-optional-try

// MARK: - Failable initializers
let str = "5"
let num = Int(str)

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}
// why a failable init?
// https://www.hackingwithswift.com/quick-start/understanding-swift/why-would-you-want-a-failable-initializer

struct Employee {
    var userName: String
    var password: String
    
    init?(userName: String, password: String) {
        guard password.count >= 8 else { return nil }
        guard password.lowercased() != "password" else { return nil }
        
        self.userName = userName
        self.password = password
    }
}

let tim = Employee(userName: "TimC", password: "aaaa")
let craig = Employee(userName: "Crag", password: "ha2iljsfelij3")

// MARK: - Typecasting

class Anima { }
class Fish: Anima { }

class Dog: Anima {
    func makeNoise() {
        print("woof")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
// When is type casting useful in Swift?
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-is-type-casting-useful-in-swift

class Person1 {
    var name = "Anonymous"
}

class Customer: Person1 {
    var id = 12345
}

class Employee1: Person1 {
    var salary = 50_000
}

let customer2 = Customer()
let employee = Employee1()
let people = [customer2 , employee]
/*
 Because both Customer and Employee inherit from Person, Swift will consider that people constant to be a Person array. So, if we loop over people we’ll only be able to access the name of each item in the array – or at least we would only be able to do that, if it weren’t for type casting:
 */
for person in people {
    if let customer = person as? Customer {
        print("I'm a customer, with id \(customer.id)")
    } else if let employee = person as? Employee1 {
        print("I'm an employee, earning $\(employee.salary)")
    }
}

class Person_t {
    var name = "Taylor Swift"
}
class User_t: Person_t { }
let taylor = User_t()
if let user = taylor as? User_t {
    print("\(user.name) is a user.")
}
// MARK: - Summary

/*
 Optionals let us represent the absence of a value in a clear and unambiguous way.
 
 Swift won’t let us use optionals without unwrapping them, either using if let or using guard let.
 
 You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash.
 
 Implicitly unwrapped optionals don’t have the safety checks of regular optionals.
 
 You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside.
 
 Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
 
 You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
 
 If you need your initializer to fail when it’s given bad input, use init?() to make a failable initializer.
 
 You can use typecasting to convert one type of object to another.
 */


enum NetworkError: Error {
    case insecure
    case noWifi
}

func downloadData(from url: String) throws -> String {
    if url.hasPrefix("https://") {
        return "This is the best"
    } else {
       throw NetworkError.insecure
    }
}
if let data = try? downloadData(from: "https://yahoo.com") {
    print(data)
} else {
    print("Unable to fetch data")
}
