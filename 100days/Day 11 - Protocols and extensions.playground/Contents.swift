import UIKit

// MARK: - Protocols
//
//protocol Identifiable {
//    var id: String { get set }
//}
//struct User: Identifiable {
//    var id: String
//}
//
//func displayID(thing: Identifiable) {
//    print("My ID is \(thing.id)")
//}

// why protocols?
// https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-need-protocols
/*
 In practice, what protocols allow us to do is treat our data in more general terms. So, rather than saying “this buy() method must accept a Book object,” we can say “this method can accept anything that conforms to the Purchaseable protocol.
 */
struct Book1 {
    var name: String
}

func buy(_ book: Book1) {
    print("I'm buying this \(book.name)")
}
/*
 To create a more flexible, protocol-based approach we would first create a protocol that declares the basic functionality we need. This might be many methods and properties, but here we’re just going to say that we need a name string:
 */
protocol Purchaseable {
    var name: String { get set }
}

/*
 Now we can go ahead and define as many structs as we need, with each one conforming to that protocol by having a name string:
 */
struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}
/*
 You’ll notice each one of those types has a different property that wasn’t declared in the protocol, and that’s okay – protocols determine the minimum required functionality, but we can always add more.

 Finally, we can rewrite the buy() function so that it accepts any kind of Purchaseable item:
 */

func buy_s(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

// MARK: - Protocol inheritance

protocol Payable {
    func calculatedWage() -> Int
}

protocol NeedsTraining{
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// When to use protocol inheritance?
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-we-use-protocol-inheritance

/*
 One common reason for using protocol inheritance is to combine functionality for common work. For example:

 All products have a price and a weight
 All computers have a CPU, plus how much memory they have and how much storage
 All laptops have a screen size
 */
protocol Product {
    var price: Double { get set }
    var weight: Int { get set }
}
protocol Computer: Product {
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}
// define Laptop protocol:
protocol Laptop: Computer {
    var screenSize: Int { get set }
}

// MARK: - Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 9
number.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
let number2 = 8
number2.isEven
// When to use extensions
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-extensions-in-swift

// MARK: - Protocol extensions

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}
//pythons.summarize()
//beatles.summarize()

// when protocol extensions useful
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-are-protocol-extensions-useful-in-swift

let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2)}
print(allEven)

let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }
print(allEven2)

let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }
print(allEven3)

// MARK: - protocol-oriented programming

protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id)")
    }
}

struct User3: Identifiable {
    var id: String
}

let asdf = User3(id: "34")
asdf.identify()

// How is protocol-oriented programming different from object-oriented programming?
// https://www.hackingwithswift.com/quick-start/understanding-swift/how-is-protocol-oriented-programming-different-from-object-oriented-programming

// MARK: - Summary
/*
 Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
 
 You can build protocols on top of other protocols, similar to classes.
 
 Extensions let you add methods and computed properties to specific types such as Int.
 
 Protocol extensions let you add methods and computed properties to protocols.
 
 Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
 */
