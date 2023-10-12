import UIKit

// 1.


class SuperEnemy  {
    var name: String
    var hitPoints: Int
    var specialAttack: String
    
    init(name: String, hitPoints: Int, specialAttack: String) {
        self.name = name
        self.hitPoints = hitPoints
        self.specialAttack = specialAttack
    }
    init(){
        self.name = ""
        self.hitPoints = 0
        self.specialAttack = ""
    }
}

let enemy1 = SuperEnemy(name: "Madara Uchiha", hitPoints: 100, specialAttack: "Susanoo")
print("\(enemy1.name), Hit Points \(enemy1.hitPoints), Special Attack: \(enemy1.specialAttack)" )


//2.
print()
protocol SuperHero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool {get}
    var superPowers: [String: Int] { get }
    
    mutating func attack(target: SuperEnemy) -> Int
}

struct SuperHeroCharacter: SuperHero {
    let name: String
    let alias: String
    let isEvil: Bool
    let superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        guard let power = superPowers.values.max() else {
            return target.hitPoints
        }
        let leftHitPoints = target.hitPoints - power
        return max(0, leftHitPoints)
    }
}


let superHero = SuperHeroCharacter(name: "Might Guy", alias: "Hidden Leaf", isEvil: false, superPowers: ["8 Gates" : 35])
let leftHitpoints = superHero.attack(target: enemy1)
print("Left Hitpoints after attack: \(leftHitpoints)")
superHero.superHeroInfo()

//3.
extension SuperHero {
    func superHeroInfo() {
        print("name: \(name), alias: \(alias), is evil: \(isEvil)")
        print("SuperPowers:")
        
        for powers in superPowers {
            print(" \(powers)")
        }
    }
}

//4.
print()

struct KakashiTheCopyNinja: SuperHero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let randomDamage = Int.random(in: 20...40)
        target.hitPoints -= randomDamage
        return target.hitPoints
    }
}

struct Naruto: SuperHero {
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String : Int]
    
    mutating func attack(target: SuperEnemy) -> Int {
        if !superPowers.isEmpty {
            let randomIndex = Int.random(in: 0..<superPowers.count)
            let superpower = Array(superPowers.keys)[randomIndex]
            let damage = superPowers.removeValue(forKey: superpower)!
            target.hitPoints -= damage
        }
        return target.hitPoints
    }
}

let enemy2 = SuperEnemy(name: "Obito Uchiha", hitPoints: 100, specialAttack: "Rinnegan")

var superHero1 = KakashiTheCopyNinja(name: "KaKashi The copy Ninja", alias: "Hidden Leaf", isEvil: false, superPowers: ["Chidory" : 25, "Susanoo" : 35])
var superHero2 = Naruto(name: "Naruto Uzumaki", alias: "Hidden Leaf", isEvil: false, superPowers: ["Nine tails chakra" : 55, "Sage Mode" : 40])
var hitpointsAFKakashi = superHero1.attack(target: enemy2)
var hitPointsAFNaruto = superHero2.attack(target: enemy2)

print("Remaining Hit Points of \(enemy2.name) after Kakashi's attack: \(hitpointsAFKakashi)")
print("Remaining Hit Points of \(enemy2.name) after Naruto's attack: \(hitPointsAFNaruto)")

//5.
print()

class SuperSquad {
    var superHeroes: [SuperHero]
    
    init(superHeroes: [SuperHero]) {
        self.superHeroes = superHeroes
    }
    func superHeroesInSquad() {
        print("Heroes in Leaf Shinobi squad:")
        for superHero in superHeroes {
            print("\(superHero.name)")
        }
    }
}

let shinob1 = SuperHeroCharacter(name: "Sasuke Uchiha", alias: "Hidden leaf", isEvil: false, superPowers: ["" : 0])
let shinobi2 = SuperHeroCharacter(name: "Shikaku Nara", alias: "Hidden leaf", isEvil: false, superPowers: ["" : 0])
let superSquad = SuperSquad(superHeroes: [shinob1, shinobi2])
superSquad.superHeroesInSquad()
 
//6.
print()
extension SuperSquad {
    func simulateShowdown(with superEnemy: SuperEnemy) {
        print("4th Ninja war: The last Stand")
        print("Superheroes in the Squad:")
        for superhero in superHeroes {
            print("\(superhero.name) (\(superhero.alias))")
        }
        print("SuperEnemy: \(superEnemy.name)")
        
        var remainingSuperpowers: [String: Int] = [:]
        
        for superhero in superHeroes {
            for (power, damage) in superhero.superPowers {
                remainingSuperpowers[power] = damage
            }
        }
        
        var superEnemyHitPoints = superEnemy.hitPoints
        var round = 1
        
        while superEnemyHitPoints > 0 && !remainingSuperpowers.isEmpty {
            print("\nRound \(round):")
            for superhero in superHeroes {
                guard !remainingSuperpowers.isEmpty else {
                    print("\(superhero.name) is out of superpowers and attacks with a normal attack.")
                    superEnemyHitPoints = max(0, superEnemyHitPoints - Int.random(in: 80...120))
                    continue
                }
                
                let randomSuperpowerIndex = Int.random(in: 0..<remainingSuperpowers.count)
                let superpower = Array(remainingSuperpowers.keys)[randomSuperpowerIndex]
                let damage = remainingSuperpowers.removeValue(forKey: superpower)!
                
                print("\(superhero.name) attacks using \(superpower) (\(damage) damage)")
                superEnemyHitPoints = max(0, superEnemyHitPoints - damage)
            }
            
            round += 1
        }
        
        print("\nBattle Result:")
        if superEnemyHitPoints == 0 {
            print("Shinobi world defeated the SuperEnemy!")
        } else {
            print("The SuperEnemy defeated the Shinobi world!")
        }
    }
}

let shinob3 = SuperHeroCharacter(name: "Naruto", alias: "Hidden leaf", isEvil: false, superPowers: ["Sage Mode" : 35, "Nine Tails Chakra" : 50, "Rasegnan" : 30])
let shinobi4 = SuperHeroCharacter(name: "Sasuke", alias: "Hidden leaf", isEvil: false, superPowers: ["Susanoo" : 55, "Chidory" : 25])
let superSquad1 = SuperSquad(superHeroes: [shinob3, shinobi4])
let enemy = SuperEnemy(name: "Ten tails", hitPoints: 100, specialAttack: "Devine Tree")

superSquad.simulateShowdown(with: enemy)
