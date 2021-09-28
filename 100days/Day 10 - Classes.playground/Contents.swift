// MARK: - Make Classes
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")
/*
 Classes do not come with synthesized memberwise initializers.
 
 One class can be built upon (“inherit from”) another class, gaining its properties and methods.
 
 Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
 
 Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
 
 Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.
 https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-both-classes-and-structs
 */

// MARK: - Class inheritance
class Dog2 {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
class Poodle: Dog2 {
    init(name: String){
        super.init(name: name, breed: "Poodle")
    }
}

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-dont-swift-classes-have-a-memberwise-initializer

// MARK: - Overriding methods
class Dog3 {
    func makeNoise() {
        print("Woof")
    }
}
class Poodle2: Dog3 {
    override func makeNoise() {
        print("Yip")
    }
}
let poppy2 = Poodle2()
poppy2.makeNoise()

// https://www.hackingwithswift.com/quick-start/understanding-swift/when-would-you-want-to-override-a-method

// MARK: - Final classes

//  when you declare a class as being final, no other class can inherit from it.
final class Dog4 {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// https://www.hackingwithswift.com/quick-start/understanding-swift/which-classes-should-be-declared-as-final

// MARK: - Copying objects
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin"
print(singer.name)

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-copies-of-a-class-share-their-data

// MARK: - Deinitializers

class Person {
    var name = "John Doe"
    
    deinit {
        print("\(name) is no more")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}
// https://www.hackingwithswift.com/quick-start/understanding-swift/why-do-classes-have-deinitializers-and-structs-dont

// MARK: - Mutability

class Singer2 {
    var name = "Taylor"
}

let taylor2 = Singer2()
taylor2.name = "Ed"
print(taylor2.name)

// if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.

// https://www.hackingwithswift.com/quick-start/understanding-swift/why-can-variable-properties-in-constant-classes-be-changed

// MARK: - Summary

/*
 Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 
 One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
 
 You can mark a class with the final keyword, which stops other classes from inheriting from it.
 
 Method overriding lets a child class replace a method in its parent class with a new implementation.
 When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
 
 Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
 
 Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
 */
