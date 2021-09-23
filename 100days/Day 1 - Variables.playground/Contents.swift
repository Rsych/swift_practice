var name = "Ryan"
let album: String = "Reputation"
let year: Int = 24
let height: Double = 1.71
let tay: Bool = true

var desc = """
variables for var
constants for let
"""
print(desc)

/*
Use var  to store temporary information, if you need to store and transform values

*/
var num = "42"
//num = 42 // can't assign int to str

var num1 = 1
var num2 = 1.0

//num1 + num2 //can't do operation int + double

// When to use an array, a set, or a tuple?

/*
 If you want to store a list of all words in a dictionary for a game, that has no duplicates and the order doesn’t matter so you would go for a set.
 */
let setOfBlogCategories: Set<String> = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]

/*
 If you want to store all the articles read by a user, you would use a set if the order didn’t matter (if all you cared about was whether they had read it or not), or use an array if the order did matter.

 If you want to store a list of high scores for a video game, that has an order that matters and might contain duplicates (if two players get the same score), so you’d use an array.

 If you want to store items for a todo list, that works best when the order is predictable so you should use an array.
 */
var website_array = ["Apple", "www.apple.com"]

 /*
 If you want to hold precisely two strings, or precisely two strings and an integer, or precisely three Booleans, or similar, you should use a tuple.
 */
var website_tuple = (name: "Apple", url: "www.apple.com")

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]

let historyResult = results["history", default: 0]
print(results)
website_tuple.name
results
historyResult
print(historyResult)

