import Foundation

// iOS Communications
// By: Zaid Rahawi
// Delegation Pattern

// MARK: - Protocols

protocol Plane {
    var model: String { get }
}

// MARK: - Delegates

protocol ATC: class {
    func planeDidTakeOff(_ plane: Plane)
    func planeDidLand(_ plane: Plane)
}

// MARK: - Example

class Airbus: Plane {
    let model: String
    
    var isOnAir: Bool = false
    
    weak var delegate: ATC?
    
    init(model: String) {
        self.model = model
    }
    
    func takeOff() {
        isOnAir = true
        delegate?.planeDidTakeOff(self)
    }
    
    func land() {
        isOnAir = false
        delegate?.planeDidLand(self)
    }
}

class Airport: ATC {
    func planeDidTakeOff(_ plane: Plane) {
        print("Airport: \(plane.model) is taking off")
    }
    
    func planeDidLand(_ plane: Plane) {
        print("Airport: \(plane.model) landed")
    }
}

let a380 = Airbus(model: "A380")
let delegate = Airport()

a380.delegate = delegate

a380.takeOff()
a380.land()
