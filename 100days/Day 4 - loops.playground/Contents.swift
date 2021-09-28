// Loops

// for loops
//let count_num = 1...10
//
//for number in count_num {
//    print("Number is \(number)")
//}
// let albums = ["Red", "1989", "resfse"]
//
//for album in albums {
//    print("\(album) is on Apple Music")
//}
//
//for _ in 1...5 {
//    print("Hi")
//}
//
//// while loops
//
//var number = 1
//
//while number <= 5 {
//    print(number)
//    number += 1
//}
//var number2: Int = 10
//while number2 > 0 {
//    number2 -= 2
//    if number2 % 2 == 0 {
//        print("\(number2) is an even number.")
//    }
//}

//// Repeat loops
//
//var number = 1
//repeat {
//    print(number)
//    number += 1
//} while number <= 20
//print("Done")
 // https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-a-repeat-loop

//// Exiting loops
//var countDown = 10
//
//while countDown >= 0 {
//    print(countDown)
//
//    if countDown == 4{
//        print("I'm bored.")
//        break
//    }
//    countDown -= 1
//}
//
//print("blast off")

//// Skipping items
//
//for i in 1...10 {
//    if i % 2 == 1 {
//        continue
//    }
//    print(i)
//}
//let fibonacci = [1, 1, 2, 3, 5, 8, 13, 21]
//var position = 0
//while position <= 7 {
//    let value = fibonacci[position]
//    position += 1
//    if value < 2 {
//       continue
//    }
//    print("Fibonacci number \(position) is \(value)")
//}

// Infinite loops

var counter = 0

while true {
    print(" ")
    counter += 1
    if counter == 273 {
        break
    }
}

// Summary

/*
 Loops let us repeat code until a condition is false.
 The most common loop is for, which assigns each item inside the loop to a temporary constant.
 If you don’t need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work.
 There are while loops, which you provide with an explicit condition to check.
 Although they are similar to while loops, repeat loops always run the body of their loop at least once.
 You can exit a single loop using break, but if you have nested loops you need to use break followed by whatever label you placed before your outer loop.
 You can skip items in a loop using continue.
 Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a condition somewhere to end your infinite loops!
 */
