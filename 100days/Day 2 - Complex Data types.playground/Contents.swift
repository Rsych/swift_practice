import UIKit


let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])
print(colors2)
/*
 Sets are collections of values just like arrays, except they have two differences:

 Items aren’t stored in any order; they are stored in what is effectively a random order.
 No item can appear twice in a set; all items must be unique.
 */

// Tuples

var name = (first: "Taylor", last: "Swift")

name.0
name.1
name.first
/*
 Remember, you can change the values inside a tuple after you create it, but not the types of values. So, if you tried to change name to be (first: "Justin", age: 25) you would get an error.
 */

// Arrays vs sets vs tuples

let add_tuples = (house: 555, street: "taylor avenue", city:"NY")
let set_ss = Set(["Arras", "sfef", "dsgseg"])
let add_array = ["safeasf", "fsef", "slghluh", "fsef", "fsef"]


// Dictionaries

let heights = [
    "Ryan": 1.7,
    "Naomi": 1.5
]

heights["Ryan"]

// Dictionary default values

let favioriteIce = [
    "Paul": "Chocolate",
    "Naomi": "Vanilla"]
favioriteIce["Paul"]
favioriteIce["Ryan"]
favioriteIce["Ryan", default: "Unknown"]


// Creating empty collections

var teams = [String:String]()

teams["Pauls"] = "red"

var results = [Int]()
var resultss = Array<Int>()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()

// Enumerations aka enums

let result_enum = "failure"
let result_enum2 = "failed"
let result_eunm3 = "fail"
// you could make mistakes
// enum makes easier

enum Result {
    case success
    case failure
}

let result4 = Result.failure

// Enum associated values

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}
// eunms can have raw values
enum Mood:Int {
    case happy
    case sad
    case grumpy
    case hungry
}

// Enum raw values

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 2)
// can assign mercury as num 1 element

/*
 Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 Arrays store items in the order you add them, and you access them using numerical positions.
 Sets store items without any order, so you can’t access them using numerical positions.
 Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 Dictionaries store items according to a key, and you can read items using those keys.
 Enums are a way of grouping related values so you can use them without spelling mistakes.
 You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */
