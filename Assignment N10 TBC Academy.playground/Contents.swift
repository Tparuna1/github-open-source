import UIKit


//4.

class StationModule {
    private var moduleName: String
    private var drone: String?
    
    init(moduleName: String, drone: String? = nil) {
        self.moduleName = moduleName
        self.drone = drone
    }
    func taskForDrone(_ task: String) async {
        print(task)
    }
}

print("Todays' tasks:")
var task = StationModule(moduleName: "SFNM")
Task {
    await task.taskForDrone("Find New Materials")
    await task.taskForDrone("Make a research on Area 10")
}


//1.
print()
class ControlCenter: StationModule {
    var isLockDown: Bool
    var securityCode: String
    
    init(securityCode: String) {
        self.isLockDown = false
        self.securityCode = securityCode
        super.init(moduleName: "", drone: "")
    }
    func lockDown(with password: String) {
         if  password == securityCode {
             isLockDown == true
             print("Control Center is Under Lockdown.")
         } else {
             print("You are out of control, Please enter the password again.")
         }
    }
    func printControlCenterInfo() {
        if isLockDown {
            print("At this moment Control Center is under the Lockdown.")
        } else {
            print("Control Center is not under the Lockdown.")
        }
    }
}

let controlCenter = ControlCenter(securityCode: "A bluetooth Device iS connected Successfuly")
//controlCenter.lockDown(with: "connect")
controlCenter.printControlCenterInfo()
controlCenter.lockDown(with: "A bluetooth Device iS connected Successfuly")

//2.
print()

class ResearchLab: StationModule {
    var pattern: [String]
    
    init() {
        self.pattern = []
        super.init(moduleName: "", drone: "")
    }
    func addPattern(_ patternType: String ) {
        pattern.append(patternType)
        print("Pattern added to the Research Lab: \(patternType)")
    }
    func getAllPatterns() -> [String] {
        return pattern
    }
}
let researchlab = ResearchLab()
researchlab.addPattern("Magnesium")
researchlab.addPattern("Aluminium")
researchlab.addPattern("Titanium")
researchlab.addPattern("Unkwnown Material with sign of H2O")

//3.
print()

class LifeSupportSystem: StationModule {
    private var oxygenLevel: Int
    
    init() {
        self.oxygenLevel = Int.random(in: 1...100)
        super.init(moduleName: "", drone: "")
    }
    
    func levelOfOxygen() {
        oxygenLevel = Int.random(in: 1...100)
        print("Oxygen Level is: \(oxygenLevel)%")
    }
    func statusOfOxygenlevel() {
        if oxygenLevel > 30 {
            print("Oxygen level is in Normal Rangle")
        } else {
            print("Oxygen Level is lower Than it needs to be. Check system soon as Possible")
        }
    }
}
let lifeSupportSystem = LifeSupportSystem()
lifeSupportSystem.levelOfOxygen()
lifeSupportSystem.statusOfOxygenlevel()



//5. (Coppied StationModule Class into top of Playground to create previous ones as subclasses)

//6.
print()
class Drone {
    var task: String?
    unowned var assignedModule: StationModule
    weak var missiionControlLink: MissionControl?
    
    init(task: String? = nil, assignedModule: StationModule, missiionControlLink: MissionControl? = nil) {
        self.task = task
        self.assignedModule = assignedModule
        self.missiionControlLink = missiionControlLink
    }
    func checkTask() {
        if let task = task {
            print("Drone has a task: \(task)")
        } else {
            print("At this moment drone has no any task to do")
        }
    }
}
let module = StationModule(moduleName: "SFNM")
let drone = Drone(task: "Search for Area-9", assignedModule: module)
drone.checkTask()



//7.
class OrbitronSpaceStation: ControlCenter {
    var controlCenter: ControlCenter
    var researchLab: ResearchLab
    var lifeSupportSystem: LifeSupportSystem
    
    init(controlCenter: ControlCenter, researchLab: ResearchLab, lifeSupportSystem: LifeSupportSystem) {
        self.controlCenter = controlCenter
        self.researchLab = researchLab
        self.lifeSupportSystem = lifeSupportSystem
        super.init(securityCode: "bluetooth Device iS connected Successfuly")
    }
    override func printControlCenterInfo() {
        if isLockDown {
            print("At this moment Control Center is under the Lockdown.")
        } else {
            print("Control Center is not under the Lockdown.")
        }
    }
}
controlCenter.lockDown(with: "A bluetooth Device iS connected Successfuly")


let drone1 = Drone(assignedModule: controlCenter)
let drone2 = Drone(assignedModule: researchlab)
let drone3 = Drone(assignedModule: lifeSupportSystem)


//8.
print()
class MissionControl: OrbitronSpaceStation  {
    var spaceStation: OrbitronSpaceStation?
    
    func connectToOrbitron(_ spaceStation: OrbitronSpaceStation) {
        self.spaceStation = spaceStation
        print("Connected to Orbitron Space Station")
    }
    func requestControlCenterStatus(_ isLockDown: ControlCenter) {
        controlCenter.printControlCenterInfo()
    }
    func requestOxygenStatus(_ oxygenLevel: LifeSupportSystem) {
        oxygenLevel.statusOfOxygenlevel()
    }
    func requestDroneStarus(_ task: Drone) {
        drone.checkTask()
    }
}

let missionControl = MissionControl(controlCenter: controlCenter, researchLab: researchlab, lifeSupportSystem: lifeSupportSystem)
missionControl.requestOxygenStatus(lifeSupportSystem)
missionControl.requestControlCenterStatus(controlCenter)
missionControl.requestDroneStarus(drone)
let orbitronSpaceStation = OrbitronSpaceStation(controlCenter: controlCenter, researchLab: researchlab, lifeSupportSystem: lifeSupportSystem)
missionControl.connectToOrbitron(orbitronSpaceStation)

//9.
print()
class OperatingPanel {
    var orbitronSpaceStation: OrbitronSpaceStation?
    var missionControl: MissionControl
    
    init(orbitronSpaceStation: OrbitronSpaceStation? = nil, missionControl: MissionControl) {
        self.orbitronSpaceStation = orbitronSpaceStation
        self.missionControl = missionControl
    }
    func connectToOrbitron(_ missionControl: MissionControl, orbitronSpaceStation: OrbitronSpaceStation) {
        missionControl.spaceStation = orbitronSpaceStation
    }
    func taskforDrone1(_ task1: String) async {
        print(task1)
    }
    func taskforDrone2(_ task1: String) async {
        print(task2)
    }
    func taskforDrone3(_ task1: String) async {
        print(task3)
    }
}
print("Assigned Tasks For Drones")
var task1 = ControlCenter(securityCode: "controlCenter")
Task {
    await task1.taskForDrone("Find New Materials")
}
let task2 = ResearchLab()
Task {
    await task2.taskForDrone("Observe New Elements of Found Materials")
}
let task3 = lifeSupportSystem
Task {
    await task3.taskForDrone("Check System")
}


let operatingPanel = OperatingPanel(missionControl: missionControl)
var orbitronSpaceStation1 = OrbitronSpaceStation(controlCenter: controlCenter, researchLab: researchlab, lifeSupportSystem: lifeSupportSystem)
operatingPanel.connectToOrbitron(missionControl, orbitronSpaceStation: orbitronSpaceStation)
missionControl.requestOxygenStatus(lifeSupportSystem)
controlCenter.lockDown(with: "A bluetooth Device iS connected Successfuly")



