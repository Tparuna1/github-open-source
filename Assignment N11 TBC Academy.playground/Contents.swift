import UIKit

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
    func fireCannons(count: Int) {
        print("\(name) is firing \(count) cannons")
    }
    
//    func lisCrew() {
//        print("Crew Members")
//        for crewMember in crewManager.getCrew() {
//            print("- \(crewMember)")
//        }
//    }
//    func listCargo() {
//        print("Goods in Cargo:")
//        for cargoItem in cargoManager.getCargo() {
//            print("- \(cargoItem)")
//        }
//    }
    
    
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
    func firingCannons() {
        print("\(name) is firing cannons")
    }
}

class CargoManager {
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
extension CargoManager {
    func getCargo() -> [String] {
        return cargo
    }
}

class CrewManager {
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
extension CrewManager {
    func getCrew() -> [String] {
        return crew
    }
}

class Frigate: PirateShip {
    var frigateProperty: String
    
    init(name: String, cannonsCount: Int, frigateProperty: String) {
        self.frigateProperty = frigateProperty
    }
    func loadTreassure() {
        print("\(name) is loading treasure")
    }
    
}

class Galleon: PirateShip {
    var galleonProperty: Int
    
    init(name: String, cannonsCount: Int, galleonProperty: Int) {
        self.galleonProperty = galleonProperty
    }
    func stealthAttack() {
        print("\(name) is performing stealth attack")
    }
    
}



let pirateShip = PirateShip(name: "Sunny", cannonsCount: 10, cargoManager: CargoManaging, crewManager: CrewManaging)
pirateShip.firingCannons()

let cargoManager = CargoManager()
cargoManager.addCargo("Wine")
cargoManager.addCargo("Beer")
cargoManager.addCargo("Vodka")
cargoManager.removeCargo(cargo: "Vodka")

let crewManager = CrewManager()
crewManager.addCrew("Luffy")
crewManager.addCrew("Zoro")

pirateShip.lisCrew()
pirateShip.listCargo()

let galleonShip = PirateShip(name: "Galleon", cannonsCount: 50)
galleonShip.fireCannons(count: 50)
