// MARK: - Creating basic closures

//Swift lets us use functions just like any other type such as strings and integers.
//let driving = {
//    print("i'm driving a car")
//}
//driving()
/*
 One of the most common reasons for closures in Swift is to store functionality – to be able to say “here’s some work I want you to do at some point, but not necessarily now.” Some examples:

 Running some code after a delay.
 Running some code after an animation has finished.
 Running some code when a download has finished.
 Running some code when a user has selected an option from your menu.
 https://www.hackingwithswift.com/quick-start/understanding-swift/what-the-heck-are-closures-and-why-does-swift-love-them-so-much
 */

// MARK: - Accepting parameters in a closure

//let driving = {(place: String) in
//    print("I'm driving in \(place) now")
//}
//driving("london")
//
//func pay(user: String, amount: Int){
//    // code
//}
//let payment = {(user: String, amount: Int) in
//    // code
//}
// Closures cannot use external parameter labels.

// MARK: - Returning values from closure
//let driving = { (place: String) in
//    print("I'm going to \(place)")
//}
//let drivingWithReturn = { (place: String) -> String in
//    return "I'm going to \(place) in my car"
//}
//let message = drivingWithReturn("London")
//print(message)
// https://www.hackingwithswift.com/quick-start/understanding-swift/how-do-you-return-a-value-from-a-closure-that-takes-no-parameters

// MARK: - Closures as parameters
//let driving = {
//    print("I'm driving in my car")
//}
//func travel(action: () -> Void){
//    print("I'm getting ready to go.")
//    action()
//    print("i arrived!")
//}
//travel(action: driving)

// MARK: - Trailing closure syntax

func travel(action: () -> Void){
    print("I'm getting ready")
    action()
    print("I arrived")
}

travel() {
    print("I'm driving")
}

// why does swift have trailing closure syntax?

func animate(duration: Double, animations: () -> Void){
    print("Starting a \(duration) second animation")
    animations()
}
// We can call that function without a trailing closure like this:

animate(duration: 3, animations: {
    print("fade out")
})
/* That’s very common. Many people don’t use trailing closures, and that’s OK. But many more Swift developers look at the }) at the end and wince a little – it isn’t pleasant.
 
 Trailing closures allow us to clean that up, while also removing the animations parameter label. That same function call becomes this:
 */
animate(duration: 3) {
    print("Fade out the image")
}
/*
 Trailing closures work best when their meaning is directly attached to the name of the function – you can see what the closure is doing because the function is called animate().
 https://www.hackingwithswift.com/quick-start/understanding-swift/why-does-swift-have-trailing-closure-syntax
*/
