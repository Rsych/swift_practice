// MARK: - Functions

import CoreGraphics

func faveriteAlbum() {
    print("My fav is Fearless")
}
faveriteAlbum()
func faveriteAlbum1(name: String, year: Int) {
    print("My fav is \(name), released in \(year)")
}
faveriteAlbum1(name: "Fearless", year: 1996)

func countLettersInString(myString string: String) {
    print("This string \(string) has \(string.count) letters")
}
countLettersInString(myString: "Hello")

func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true}
    
    return false
}
albumIsTaylor(name: "Taylor Swift")

// MARK: - Optionals
// https://www.hackingwithswift.com/read/0/12/optionals

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

func takehaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}
getHaterStatus(weather: "sunny")
if let haterStatus = getHaterStatus(weather: "rainy") {
    takehaterAction(status: haterStatus)
}

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006}
    if name == "Fearless" { return 2008 }
    
    return nil
}

if let yearAlbum = yearAlbumReleased(name: "Taylor Swift") {
    print(yearAlbum)
}

// Force unwrapping optionals

var year = yearAlbumReleased(name: "Taylor")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}
// MARK: - Optional chaining

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}
let album =  albumReleased(year: 2006)
let str = "Hello World"
print(str.uppercased())
let album_2 = albumReleased(year: 2006)?.uppercased()
//let album_3 = albumReleased(year: 2006)?.someOptionalValue?.SomeOtherOptionalValue?.whatever

// nil coalescing operator

let album_3 = albumReleased(year: 2007) ?? "Unknown"

// MARK: - Enumerations

enum WeatherType {
    case sun, cloud, rain, wind, snow
}

func getHaterStatus_1(weather: WeatherType) -> String? {
    if weather == WeatherType.sun {
        return nil
    } else {
        return "hate"
    }
}
getHaterStatus_1(weather: WeatherType.cloud)
getHaterStatus_1(weather: .sun)

func getHaterStatus_2(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind:
        return "Cloudy"
    case .rain:
        return "Hate"
    default:
        return "Snow"
    }
}
getHaterStatus_2(weather: .snow)

enum WeatherType2 {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus_3(weather: WeatherType2) -> String? {
    switch weather {
    case .sun:
        return "Hate"
    case .cloud:
        return "nil"
    case .rain:
        return "Rainy"
    case .wind(let speed) where speed < 10:
        return "meh"
    case .wind, .snow:
        return "cool"
    }
}
getHaterStatus_3(weather: .wind(speed: 9))

// MARK: - Structs

struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("Wearing \(clothes) and \(shoes)")
    }
}
let Taylor = Person(clothes: "T-shirt", shoes: "Sneakers")
let other = Person(clothes: "Short", shoes: "high heels")

print(Taylor.clothes)
Taylor.describe()

// MARK: - Classes

class Person_class {
    var clothes_c: String
    var shoes_c: String
    
    init(clothes_c: String, shoes_c: String) {
        self.clothes_c = clothes_c
        self.shoes_c = shoes_c
    }
}

class Singer: Person_class {
    var name_c: String
    var age_c: Int
    
    init(clothes_c: String, shoes_c: String, name_c: String, age_c: Int) {
        self.name_c = name_c
        self.age_c = age_c
        super.init(clothes_c: clothes_c, shoes_c: shoes_c)
    }
    func sing() {
        print("Sing sing")
    }
}
let taylor = Singer(clothes_c: "None", shoes_c: "not", name_c: "Taylor", age_c: 22)
taylor.sing()

class CountrySinger: Singer {
    override func sing() {
        print("Country road")
    }
}
let adam = CountrySinger(clothes_c: "shirt", shoes_c: "shoes", name_c: "Adam", age_c: 30)

adam.sing()
