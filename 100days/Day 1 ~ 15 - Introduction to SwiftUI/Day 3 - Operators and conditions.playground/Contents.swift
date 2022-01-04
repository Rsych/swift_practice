let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore

// operator overloading

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

// Compound assignment operators

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "sea"

let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

// Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Ace - lucky!")
} else if firstCard + secondCard == 21{
    print("Blackjack")
} else {
    print("Regular card")
}

// Combining conditions
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
} else {
    print("One of them are not over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of the are over 18")
}

// The ternary operator

let firstCard1 = 11
let secondCard1 = 10

print(firstCard1 == secondCard1 ? "Cards are the same" : "Cards are different")

if firstCard1 == secondCard1 {
    print("Cards are the same")
} else {
    print("cards are different")
}

// Switch

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "show":
    print("cold")
case "sunny":
    print("wear sunscreen")
    fallthrough
default:
    print("Enjoy your day")
}
// https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-switch-statements-rather-than-if


// Range operators
let score2 = 85

switch score2 {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
// ..< is the half-open range that specifies “up to but excluding” and ... is the closed range operator that specifies “up to and including”.
// https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-two-range-operators

/*
 Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
 There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
 You can use if, else, and else if to run code based on the result of a condition.
 Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
 If you have multiple conditions using the same value, it’s often clearer to use switch instead.
 You can make ranges using ..< and ... depending on whether the last number should be excluded or included.
 */

