//
//  Plans.swift
//  lowcosttrip
//
//  Created by Anatoly Bardukov on 06/06/2021.
//

import Foundation

class Plan: NSObject, NSCoding {

    var from: String
    var to: String
    var flight: String
    var exposeMyself: Bool
    
    init(from: String, to: String, flight: String, exposeMyself: Bool) {
        self.from = from
        self.to = to
        self.flight = flight
        self.exposeMyself = exposeMyself

    }

    required convenience init(coder aDecoder: NSCoder) {
        let from = aDecoder.decodeObject(forKey: "from") as! String
        let to = aDecoder.decodeObject(forKey: "to") as! String
        let flight = aDecoder.decodeObject(forKey: "flight") as! String
        let exposeMyself = aDecoder.decodeBool(forKey: "exposeMyself")
        self.init(from: from, to: to, flight: flight, exposeMyself: exposeMyself)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(from, forKey: "from")
        aCoder.encode(to, forKey: "to")
        aCoder.encode(flight, forKey: "flight")
        aCoder.encode(exposeMyself, forKey: "exposeMyself")
    }
    
    func save(key: Int) {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(
                withRootObject: Plan(from: self.from, to: self.to, flight: self.flight, exposeMyself: self.exposeMyself),
                requiringSecureCoding: false
            )
            UserDefaults().set(
                encodedData,
                forKey: "plan_\(key)"
            )
        } catch {
            print("archiving")
            return
        }
    }
}
