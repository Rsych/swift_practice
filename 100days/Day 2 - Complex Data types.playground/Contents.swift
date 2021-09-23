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

