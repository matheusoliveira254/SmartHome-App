//
//  Device.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import Foundation

class Device: Codable {
    
    let id: UUID
    var name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool = false, id: UUID = UUID()) {
        self.name = name
        self.isOn = isOn
        self.id = id
    }
}

extension Device: Equatable {
    static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.id == rhs.id
    }
}
