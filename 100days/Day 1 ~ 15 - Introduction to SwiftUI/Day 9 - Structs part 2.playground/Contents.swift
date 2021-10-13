// MARK: - Initializers
//
//struct User {
//    var username: String
//
//    init() {
//        username = "Anonymous"
//        print("Creating a new user!")
//    }
//}
//var user = User()
//user.username = "Ed"


// MARK: - Referring to the current instance
//
//struct Person {
//    var name: String
//
//    init(name: String) {
//        print("\(name) was born")
//        self.name = name
//    }
//}
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-would-you-use-self-in-a-method

// MARK: - Lazy properties

//struct FamilyTree {
//    init() {
//        print("Creating family tree!")
//    }
//}
//
//struct Person {
//    var name: String
//    lazy var familyTree = FamilyTree()
//
//    init(name: String) {
//        self.name = name
//    }
//}
//var ed = Person(name: "Ed")
//ed.familyTree

// when should properties be lazy?:
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-properties-be-lazy

// MARK: - Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let edd = Student(name: "Ed")
let taylor = Student(name: "Taylow")

print(Student.classSize)

// One common use for static properties and methods is to store common functionality you use across an entire app.

// https://www.hackingwithswift.com/quick-start/understanding-swift/whats-the-point-of-static-properties-and-methods-in-swift

// MARK: - Access control

struct Person {
    private var id: String
    init(id: String) {
        self.id = id
    }
    func identify() -> String {
        return "My social security number is \(id)"
    }
}
let eddd = Person(id: "1234")
print(Person.identify(eddd))
// https://www.hackingwithswift.com/quick-start/understanding-swift/whats-the-point-of-access-control

// MARK: - Summary

/*
 You can create your own types using structures, which can have their own properties and methods.
 
 You can use stored properties or use computed properties to calculate values on the fly.
 
 If you want to change a property inside a method, you must mark it as mutating.
 
 Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
 
 Use the self constant to refer to the current instance of a struct inside a method.
 
 The lazy keyword tells Swift to create properties only when they are first used.
 
 You can share properties and methods across all instances of a struct using the static keyword.
 
 Access control lets you restrict what code can use properties and methods.
 
 */
