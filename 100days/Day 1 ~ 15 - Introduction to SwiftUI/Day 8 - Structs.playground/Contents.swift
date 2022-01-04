// MARK: - Creating your own structs
//struct Sport {
//    var name: String
//}
//var tennis = Sport(name: "Tennis")
//print(tennis.name)
//tennis.name = "Lawn tennis"
// Why struct?

// Use this?
// func auth(_ user: (name: String, age: Int, city: String)) {...}

// This better
struct User {
    var name: String
    var age: Int
    var city: String
}
//func auth(_ user: User) {...}
// MARK: - Computed properties
struct Sport {
    var name: String
    var isOlympic: Bool
    
    var olympicStatus: String {
        if isOlympic {
            return "\(name) is an Olympic stport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympic: false)
print(chessBoxing.olympicStatus)

// when to use stored or computed property:
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-a-computed-property-or-a-stored-property

// MARK: - property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 60
progress.amount = 80

// You can also use willSet to take action before a property changes, but that is rarely used.
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-property-observers
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-willset-rather-than-didset

// MARK: - Methods
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()
/* the only real difference is that methods belong to a type,
 such as structs, enums, and classes, whereas functions do not.
 */
// https://www.hackingwithswift.com/quick-start/understanding-swift/whats-the-difference-between-a-function-and-a-method

// MARK: - Mutating methods
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()
person.name

// Swift won’t let you write methods that change properties unless you specifically request it.
// Because it changes the property, Swift will only allow that method to be called on Person instances that are variables.

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-we-need-to-mark-some-methods-as-mutating

// MARK: - Properties and methods of strings

let string = "Do or do not, there's no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.sorted())
print(string.uppercased())

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-are-strings-structs-in-swift

// MARK: - Properties and methods of arrays

var toys = ["Woody"]

print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-strings-behave-differently-from-arrays-in-swift

var myString = ""

if myString.isEmpty {
    print("it's empty")
}

