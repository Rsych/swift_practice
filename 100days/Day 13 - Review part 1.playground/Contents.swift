// MARK: - Variables and constants

// var can be changed, let (constant) can't be changed
var name = "Tim"
name = "Romeo"
// MARK: - Types of Data
var name2: String
name2 = "Tim Gg"

var age: Int
age = 25

// different accuracy
var latitude: Double
var longitude: Float
latitude = 36.166667
longitude = -8621433.7888333

var stayOutTooLate: Bool
stayOutTooLate = true
var missBed = false

// MARK: - Operators

var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10

b += 10
b -= 10

var c = 1.1
var d = 2.2
var e = c + d

var name3 = "Tim"
var name4 = "Romeo"
var both = name3 + " and " + name4

var f = 1.1
var g = 2.2
f > 3
f >= 3
f < 4

var name5 = "Tim Mc"
name5 == "Tim Mc"

var itIsRight = true
!itIsRight
// MARK: - String interpolation

var name6 = "Tim Mc"
"Your name is \(name6)"

// MARK: - Arrays

var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it", "You are", "Back"]
songs[0]
type(of: songs)

//If you really want the array to hold any kind of data, use the special Any data type, like this:

var songs2: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]
type(of: songs2)

// creating Arrays

var songs3: [String] = []
var songs4 = [String]()
songs3.append("Baba")
songs3.append(contentsOf: ["Nice", "happy"])
// MARK: - Dictionaries

var person = ["first": "Taylor",
              "middle": "Alison",
              "month": "December"]
person["middle"]

// MARK: - Conditional statements

var action: String
var person1 = "hater"

if person1 == "hater" {
    action = "hate"
} else if person1 == "player" {
    action = "play"
} else {
    action = "cruise"
}

// Evaluating multiple conditions

var action1: String
var stayOutTooLate1 = true
var nothingInBrain = true

if stayOutTooLate1 && nothingInBrain {
    action1 = "cruise"
}

// MARK: - Loops

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

// while loops

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1
    
    if counter == 10 {
        break
    }
}
/*
 There is a counterpart to break called continue. Whereas breaking out of a loop stops execution immediately and continues directly after the loop, continuing a loop only exits the current iteration of the loop – it will jump back to the top of the loop and pick up from there.
 */
var songs5 = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs5 {
    if song == "You Belong with Me" {
        continue
    }
    
    print("My fav song is \(song)")
}
// MARK: - Switch

let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting")
case 1:
    print("You just released iTunes")
case 2:
    print("You just released speaek")
default:
    print("Have you done?")
}

// case can be range like case 0...1:

