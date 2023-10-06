import UIKit

var greeting = "Hello, playground"



// 1.

enum DayofWeeks {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func getDayofWeeks(on day: DayofWeeks) {
    
    switch day {
    case.monday:
        print("Workday")
    case.tuesday:
        print("Workday")
    case.wednesday:
        print("Workday")
    case.thursday:
        print("Workday")
    case.friday:
        print("Workday")
    case.saturday:
        print("Weekend")
    case.sunday:
        print("Weekend")
    }
}

getDayofWeeks(on: .sunday)






// 2.

print()

enum Weather {
    case sunny(degree: Double)
    case cloudy(degree: Double)
    case rainy(degree: Double)
    case snowy(degree: Double)
}

func getAdviceforClothes(for advice: Weather) {
    switch advice {
        
    case .sunny(degree: let degree):
        degree == 20
        print("you can wear a short it is \(degree) celsius today")
    case .cloudy(degree: let degree):
        degree == 10
        print("Take a coat with you, it will be \(degree) celsius today")
    case .rainy(degree: let degree):
        degree == 5
        print("Do not forget an umbrella today is rainy weather with \(degree) celsius today")
    case .snowy(degree: let degree):
        degree == 2
        print("Dont you wanna wear a jacket today? it is \(degree) celsius today")
    }
}

getAdviceforClothes(for: .cloudy(degree: 10))





// 3.

print()

struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}

    
func getPublicationYear(books: [Book], year: Int) -> [Book] {
     books.filter {$0.publicationYear > year}
}
    

let book1 = Book(title: "White Nights", author: "Fyodor Dostoevsky", publicationYear: 1848)
let book2 = Book(title: "Me Bebia Iliko da Ilarioni", author: "Nodar Dumbadze", publicationYear: 1960)
let book3 = Book(title: "The Godfather", author: "Mario Puzo", publicationYear: 1969)
let book4 = Book(title: "Foundation", author: "Isaac Asimov", publicationYear: 1951)
    
let arrayOfBooks = [book1, book2, book3, book4]

let pubBooksAF = getPublicationYear(books: arrayOfBooks, year: 1900)

for book in pubBooksAF {
    print("\(book.title)")
}





// 4.
print()


struct BanckAccaount {
    var holderName: String
    var accountNumber: Int
    var balance: Double
    
    
    init(holderName: String, accountNumber: Int, balance: Double) {
        self.holderName = holderName
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    mutating func withdraw(amount: Double)  {
        if amount < balance {
            balance -= amount
            print("withdraw \(amount). New Balance: \(balance) GEL")
        } else {
            print("Not enough amount on a card for withdraw \(amount) GEL.")
        }
    }
    mutating func deposit(amount: Double) {
        balance += amount
        print("Deposited amount \(amount)")
    }
    mutating func transfer(amount: Double, to account: inout BanckAccaount) {
        if amount <= balance {
            balance -= amount
            account.balance += amount
            print("Transffer \(amount) to  \(holderName). New Balance: \(balance)")
        } else {
            print("Not enough amount on your balance to make a transfer")
        }
    }
    
}


var account = BanckAccaount(holderName: "Tornike Paru", accountNumber: 23457, balance: 400)

account.deposit(amount: 500)
print("Balance on your Card is: \(account.balance) GEL")
account.withdraw(amount: 100)
account.withdraw(amount: 120)


print("Balance on your Card is: \(account.balance) GEL")
print(account.withdraw(amount: 800))

var account1 = BanckAccaount(holderName: "Gela Gel", accountNumber: 367845, balance: 600)
var account2 = BanckAccaount(holderName: "Lela Lel", accountNumber: 248268, balance: 400)

account1.transfer(amount: 300, to: &account2)
print("\nBalances after transfer:")
print("Account 1 Balance: \(account1.balance)")
print("Account 2 Balance: \(account2.balance)")

account2.transfer(amount: 800, to: &account1)
print("\nBalances after transfer:")
print("Account 1 Balance: \(account1.balance)")
print("Account 2 Balance: \(account2.balance)")


// 5.
print()


enum Genre {
    case classical
    case hardRock
    case jazz
    case country
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        "song in (\(genre)) named \(title) by \(artist)"
    }
    lazy var publisher: String? = {
        "Publisher: MusicCenter"
    }()
}


var playlist = [
    Song(title: "Moonlight Sonata", artist: "Bethoven", duration: 15.0, genre: .classical),
    Song(title: "Mein Hert Brennt", artist: "Rammstein", duration: 3.06, genre: .hardRock),
    Song(title: "What a wonderful world", artist: "Louis Armstrong", duration: 2.30, genre: .jazz),
    Song(title: "Sinnerman", artist: "Nina Simone", duration: 5.3, genre: .jazz),
    Song(title: "Ain't no grave", artist: "Johnny Cash", duration: 3.0, genre: .country),
]

func filterByGenre(playlist: [Song], genre: Genre) -> [Song]   {
    let filteredSongs = playlist.filter { $0.genre == genre }
    return filteredSongs
}
    

let selectGenre = Genre.jazz
let filteredSongs = filterByGenre(playlist: playlist, genre: .jazz)


if filteredSongs.isEmpty {
    print("No songs are found in \(selectGenre) genre.")
} else {
    print("Songs in \(selectGenre) genre:")
    for song in filteredSongs {
        print(song.description)
    }
}

