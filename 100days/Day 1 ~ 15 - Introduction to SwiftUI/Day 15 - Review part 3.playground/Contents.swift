// MARK: - Properties
import UIKit

struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        didSet{
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    var shoes: String
    
    func describe() {
        print("I'm wearing \(clothes) and \(shoes)")
    }
}
func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "shirt", shoes: "heel")
taylor.describe()
taylor.clothes = "short skirts"

struct Person1 {
    var age: Int
    
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
}

var fan = Person1(age: 27)
print(fan.ageInDogYears)


// MARK: - Static properties and methods

struct TaylorFan {
    static var favioriteSong = "look What you made"
    
    var name1: String
    var age1: Int
}

let fan1 = TaylorFan(name1: "Lee", age1: 18)
TaylorFan.favioriteSong

// MARK: - Acces control

/*
 Public: this means everyone can read and write the property.
 Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.
 File Private: this means that only Swift code in the same file as the type can read and write the property.
 Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.
 */
class TaylorFan1 {
    private var name: String?
    fileprivate var age: Int?
}

// MARK: - Ploymorphism and typecasting

class Album {
    var name: String
    
    init(name: String) {
    self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    override func getPerformance() -> String {
        return "The studio album\(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor", studio: "Castle")
var fearless = StudioAlbum(name: "Speak", studio: "ARRR")
var iTunesLive = LiveAlbum(name: "Live from soho", location: "Newyork")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
}

for album in allAlbums {
    print(album.getPerformance())
    
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

let number = 5
//let text = number as! String
let text = String(number)

// MARK: - Closures

let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
