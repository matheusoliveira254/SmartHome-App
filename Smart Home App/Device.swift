//
//  Device.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import Foundation

class Device {
    
    var name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool = false) {
        self.name = name
        self.isOn = isOn
    }
}
