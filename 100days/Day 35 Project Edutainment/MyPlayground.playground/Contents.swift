import UIKit

var greeting = "Hello, playground"

func startGame(_ n: Int) -> [Int] {
    return (1...n).map { _ in
        Int.random(in: 1...12)
    }
    }
let ii = startGame(5)

ii.forEach {
    print($0)
}
