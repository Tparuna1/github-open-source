import UIKit

//1.
protocol CargoManaging {
    func addCargo(_ cargoType: String)
    func removeCargo(cargo: String)
    func getAllGoods() -> [String]
}

protocol CrewManaging {
    func addCrew(_ crewMember: String)
    func removeCrew(crew: String)
    func getAllCrewMember() -> [String]
}
protocol Cannons {
    func fireCannons(count: Int)
}

class PirateShip: Cannons {
    var name: String
    var cannonsCount: Int
    var cargoManager: CargoManaging
    var crewManager: CrewManaging
    
    init(name: String, cannonsCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.cargoManager = cargoManager
        self.crewManager = crewManager
    }
    
    func fireCannons(count: Int) {
        print("\(name) is firing \(count) cannons")
    }
    
    func lisCrew() {
        print("Crew Members")
        for crewMember in crewManager.getAllCrewMember() {
            print("- \(crewMember)")
        }
    }
    
    func listCargo() {
        print("Goods in Cargo:")
        for cargoItem in cargoManager.getAllGoods() {
            print("- \(cargoItem)")
        }
    }
}

class CargoManager: CargoManaging {
    private var cargo: [String]
    
    init() {
        self.cargo = []
    }
    
    func addCargo(_ cargoType: String) {
        cargo.append(cargoType)
        print("Goods added in Cargo: \(cargoType)")
    }
    
    func removeCargo(cargo: String) {
        if let index = self.cargo.firstIndex(of: cargo) {
            self.cargo.remove(at: index)
            print("Goods removed from cargo: \(cargo)")
        } else {
            print("\(cargo) : is not found in Cargo")
        }
    }
    
    func getAllGoods() -> [String] {
        return cargo
    }
}

class CrewManager: CrewManaging {
    private var crew: [String]
    
    init() {
        self.crew = []
    }
    
    func addCrew(_ crewMember: String) {
        crew.append(crewMember)
        print("new member added in Crew: \(crewMember)")
    }
    
    func removeCrew(crew: String) {
        if let index = self.crew.firstIndex(of: crew) {
            self.crew.remove(at: index)
            print("Crew member removed: \(crew)")
        } else {
            print("\(crew) is not part of the crew.")
        }
    }
    
    func getAllCrewMember() -> [String] {
        return crew
    }
}

extension CargoManager {
    func getCargo() -> [String] {
        return cargo
    }
}

extension CrewManager {
    func getCrew() -> [String] {
        return crew
    }
}

class Frigate: PirateShip {
    var frigateProperty: String
    
    init(name: String, cannonsCount: Int, frigateProperty: String, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.frigateProperty = frigateProperty
        super.init(name: name, cannonsCount: cannonsCount, cargoManager: cargoManager, crewManager: crewManager)
    }
    
    func loadTreasure() {
        print("\(name) is loading treasure")
    }
}


class Galleon: PirateShip {
    var galleonProperty: Int
    
    init(name: String, cannonsCount: Int, galleonProperty: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.galleonProperty = galleonProperty
        super.init(name: name, cannonsCount: cannonsCount, cargoManager: cargoManager, crewManager: crewManager)
    }
    
    func stealthAttack() {
        print("\(name) is performing stealth attack")
    }
}

let cargoManager = CargoManager()
let crewManager = CrewManager()

cargoManager.addCargo("Wine")
cargoManager.addCargo("Beer")
cargoManager.addCargo("Rome")
cargoManager.addCargo("Vodka")
cargoManager.removeCargo(cargo: "Vodka")
crewManager.addCrew("Luffy")
crewManager.addCrew("Zoro")

let frigate = Frigate(name: "Frigate", cannonsCount: 20, frigateProperty: "Fast", cargoManager: cargoManager, crewManager: crewManager)
let galleon = Galleon(name: "Galleon", cannonsCount: 30, galleonProperty: 500, cargoManager: cargoManager, crewManager: crewManager)



galleon.listCargo()
galleon.lisCrew()

//2.
print()
class TreasureMap {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure(treasureX: Int, treasureY: Int) {
        if x == treasureX && y == treasureY {
            print("Congratulations! You found the treasure!")
        } else if x == treasureX {
            print("You are on the correct x-coordinate, move closer in the y-direction.")
        } else if y == treasureY {
            print("You are on the correct y-coordinate, move closer in the x-direction.")
        } else {
            print("You are on wrong way, try moving in the right direction to find the treasure.")
        }
    }
}

//let treasureMap = TreasureMap(x: 10, y: 15)
//let treasureX = 10
//let treasureY = 5
//treasureMap.hintToTreasure(treasureX: treasureX, treasureY: treasureY)

//3.
print()
print("Check the story of our 🏴‍☠️ ship")
class SeaAdventure {
    var adventureType: String
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("The ship encountered \(adventureType)")
    }
}
let adventure = SeaAdventure(adventureType: "Attack of Marines ship")
adventure.encounter()

//4.
print()
print("Let's see, we have some conditions to discuss 📜")
class PirateCode {
    
    private func disgussTerms(term: String) {
        print("Negotiations have started: Terms \(term)")
    }
    func parley(term: String) {
        print("We agree on \(term)")
    }
    func mutiny(term:String) {
        print("We can't agree on \(term). We will fight until we die")
    }
}

let pirateCode = PirateCode()
pirateCode.parley(term: "Share the Treasure")
pirateCode.mutiny(term: "Give a map of One Piece 🗾")

//5.
print()
print("It is time for the next Adventure ⚓️💰")
class FluffyShip {
    var ship: Galleon
    var treasureMap: TreasureMap
    var pirateCodex: PirateCode
    var shouldAttack: Bool = true


    init() {
        let fluffyCargoManager = CargoManager()
        fluffyCargoManager.addCargo("Beef")
        fluffyCargoManager.addCargo("Bread")
        fluffyCargoManager.addCargo("Fish")

        let fluffyCrewManager = CrewManager()
        fluffyCrewManager.addCrew("Nami")
        fluffyCrewManager.addCrew("Usopp")
        fluffyCrewManager.addCrew("Sanji")
        fluffyCrewManager.addCrew("Jimbei")

        self.ship = Galleon(name: "Fluffy", cannonsCount: 40, galleonProperty: 700, cargoManager: fluffyCargoManager, crewManager: fluffyCrewManager)

        let treasureX = 12
        let treasureY = 7
        self.treasureMap = TreasureMap(x: treasureX, y: treasureY)

        self.pirateCodex = PirateCode()
    }

    func startAdventure() {
        let startingX = 8
        let startingY = 10

        treasureMap.hintToTreasure(treasureX: treasureMap.x, treasureY: treasureMap.y)

        let seaAdventure = SeaAdventure(adventureType: "Flying Dutchman")
        seaAdventure.encounter()

        pirateCode.mutiny(term: "Giving a map of One Piece 🗾")


        if shouldAttack {
            ship.fireCannons(count: ship.cannonsCount)
            print("Captain decides to use all cannons ☄️")
        } else {
            print("Captain decides to run away")
        }
    }
}

let fluffyShip = FluffyShip()
fluffyShip.startAdventure()
print("To Be Continued 🎬 ")

