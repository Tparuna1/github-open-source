import UIKit


// I

// 1.

class ClassBook {
    var bookID: Int
    var title: String
    var author: String
    var bookIsBorrowed: Bool
    
    init (BookID: Int, title: String, author: String, BookisBorrowed: Bool) {
        self.bookID = BookID
        self.title = title
        self.author = author
        self.bookIsBorrowed = true
        
    }
    func removeFromClassBook() {
        if self.bookIsBorrowed == false {
            print("Book is in a library")
        } else {
            print("Book is Borrowed")
        }
    }
    
    func isBookInAClass() -> Bool {
        self.bookIsBorrowed
    }
}

let myBook = ClassBook(BookID: 34, title: "White Nights", author: "dostoevsky", BookisBorrowed: true)
print("Is Book in a Class? \(myBook.isBookInAClass())")
myBook.removeFromClassBook()

// 2.
print()
class Owner {
    var ownerID: Int
    var name: String
    var borrowedBooks: [String]
    
    init(ownerID: Int, name: String) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = []
    }
    func borrowBook(_ bookTitle: String) {
        borrowedBooks.append(bookTitle)
        print("\(name) has borrowed the book: \(bookTitle)")
    }
    func returnBook(_ bookTitle: String) {
        if let index = borrowedBooks.firstIndex(of: bookTitle) {
            borrowedBooks.remove(at: index)
            print("\(name) has returned the book: \(bookTitle)")
        } else {
            print("\(name) returned: \(bookTitle)")
        }
    }
}

let owner = Owner(ownerID: 123, name: "Tornike Paru")
owner.borrowBook("White nights")
owner.borrowBook("Goals")
print("Borrowed books: \(owner.borrowedBooks)")
owner.returnBook("White nights")
print("Borrowed books after return: \(owner.borrowedBooks)")


// 3.
print()
class Library {
    var books: [String]
    var owners: [Owner]
    
    init() {
        self.books = []
        self.owners = []
    }
    
    func addBook(_ bookTitle: String) {
        books.append(bookTitle)
        print("Book added to the library: \(bookTitle)")
    }
    
    func addOwner(_ owner: Owner) {
        owners.append(owner)
        print("Owner added to the library: \(owner.name)")
    }
    
    func getAllBooks() -> [String] {
        return books
    }
    
    func getBorrowedBooks() -> [String] {
        var borrowedBooks: [String] = []
        for owner in owners {
            borrowedBooks += owner.borrowedBooks
        }
        return borrowedBooks
    }
    
    func findOwnerByID(_ ownerID: Int) -> Owner? {
        return owners.first { $0.ownerID == ownerID }
    }
    
    func givePermissionToOwner(ownerID: Int, bookTitle: String) {
        if let owner = findOwnerByID(ownerID), books.contains(bookTitle) {
            owner.borrowBook(bookTitle)
        } else {
            print("Owner not found or book is not available.")
        }
    }
}

let library = Library()

library.addBook("Eat that frog")
library.addBook("The Brothers Karamazov")
library.addBook("The mist")

let newOwner = Owner(ownerID: 4317, name: "Paru")
library.addOwner(owner)

library.givePermissionToOwner(ownerID: 4317, bookTitle: "Eat that frog")

print("All books in the library: \(library.getAllBooks())")

print("All borrowed books: \(library.getBorrowedBooks())")


// 4.
print()
let newLibrary = Library()

library.addBook("Harry Potter and the Philosopher's Stone")
library.addBook("Harry Potter and the Chamber of Secrets")
library.addBook("Harry Potter and the Prisoner of Azkaban")

owner.borrowBook("Harry Potter and the Philosopher's Stone")
owner.borrowBook("Harry Potter and the Chamber of Secrets")
owner.returnBook("Harry Potter and the Prisoner of Azkaban")

print("Borrowed Books: \(library.getBorrowedBooks())")
print("Books Left in Library: \(library.getAllBooks())")
print("Borrowed Books by \(owner.name): \(owner.borrowedBooks)")




// II
print()
// 1.

class Product {
    var productID: Int
    var name: String
    var price: Double
    
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
    init() {
        self.productID = 0
        self.name = ""
        self.price = 0.0
    }
}

let pineapple = Product(productID: 3386, name: "Pineapple", price: 2.5)
let banana = Product(productID: 2256, name: "Banana", price: 1.3)

print("Pineapple: ID - \(pineapple.productID), Name - \(pineapple.name), Price - \(pineapple.price) GEL")
print("Banana: ID - \(banana.productID), Name - \(banana.name), Price - \(banana.price)GEL")

//2.
print()
class Cart {
    var cartID: Int
    var items: [Product]
    
    init(cartID: Int) {
        self.cartID = cartID
        self.items = []
    }

    init() {
        self.cartID = 0
        self.items = []
    }
    
    func addProduct(_ product: Product) {
        items.append(product)
    }
    
    func removeProduct(productID: Int) {
        items = items.filter { $0.productID != productID }
    }
    
    func calculateTotalPrice() -> Double {
        return items.reduce(0.0) { $0 + $1.price }
    }
}

let cart = Cart(cartID: 1)
let mango = Product(productID: 2123, name: "Mango", price: 5.6)
let avocado = Product(productID: 4598, name: "Avocado", price: 4.5)
let blueBerry = Product(productID: 4598, name: "blueBerry", price: 8.14)

cart.addProduct(mango)
cart.addProduct(avocado)
cart.addProduct(blueBerry)

print("Cart ID: \(cart.cartID)")
print("Products in the cart:")
for product in cart.items {
    print("  \(product.name) - \(product.price) GEL")
}

cart.removeProduct(productID: 2123)

print("\nProducts in the cart after removal:")
for product in cart.items {
    print("  \(product.name) - \(product.price)GEL")
}

let totalPrice = cart.calculateTotalPrice()
print("\nTotal Price of products in the cart: \(totalPrice) GEL")

// 3.
print()
class User {
    var userID: Int
    var username: String
    var cart: Cart
    
    init(userID: Int, username: String, cartID: Int) {
        self.userID = userID
        self.username = username
        self.cart = Cart(cartID: cartID)
    }

    init() {
        self.userID = 0
        self.username = ""
        self.cart = Cart()
    }

    func addProductToCart(_ product: Product) {
        cart.addProduct(product)
    }

    func deleteProductFromCart(productID: Int) {
        cart.removeProduct(productID: productID)
    }

    func checkout() {
        let totalPrice = cart.calculateTotalPrice()
        print("Checkout initiated for \(username). Total price: \(totalPrice)GEL")
        print("Payment successful.")
        cart.items.removeAll()
        print("Cart cleared.")
    }
}

let user = User(userID: 237, username: "Gela Geladze", cartID: 1)

let friedChicken = Product(productID: 7856, name: "Fried Chickem", price: 12.30)
let owlEggs = Product(productID: 3967, name: "Owl Eggs", price: 99.99)

user.addProductToCart(friedChicken)
user.addProductToCart(owlEggs)

print("Products in the cart for \(user.username):")
for product in user.cart.items {
    print("  \(product.name) - \(product.price)GEL")
}

user.deleteProductFromCart(productID: 7856)

print("\nProducts in the cart after deletion:")
for product in user.cart.items {
    print("  \(product.name) - \(product.price)GEL")
}

user.checkout()

//4.
print()
let cherry = Product(productID: 2280, name: "Cherry", price: 3.1)
let grape = Product(productID: 3478, name: "Grape", price: 4.79)
let kiwi = Product(productID: 5578, name: "Kiwi", price: 5.8)
let pomegranate = Product(productID: 4, name: "Pomegranate", price: 7.9)

let user1 = User(userID: 332, username: "Rostomi", cartID: 31)
let user2 = User(userID: 567, username: "Badri", cartID: 33)

user1.addProductToCart(cherry)
user1.addProductToCart(grape)

user2.addProductToCart(grape)
user2.addProductToCart(kiwi)
user2.addProductToCart(pomegranate)

print("Prices for products in \(user1.username)'s cart:")
for product in user1.cart.items {
    print("\(product.name): \(product.price)GEL")
}

print("\nPrices for products in \(user2.username)'s cart:")
for product in user2.cart.items {
    print("\(product.name): \(product.price)GEL")
}

print("\nCheckout for \(user1.username):")
user1.checkout()

print("\nCheckout for \(user2.username):")
user2.checkout()
