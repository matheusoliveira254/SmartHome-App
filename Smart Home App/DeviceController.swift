//
//  DeviceController.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import Foundation

class DeviceController {
    
    //MARK: - Properties
    static let sharedInstance = DeviceController()
    
    private(set) var devices: [Device] = []
    
    //MARK: - Initializers
    init() {
        load()
    }
    
    //MARK: - Crud
    func create(name: String) {
        let device = Device(name: name)
        devices.append(device)
        save()
    }
    
    func toggleIsOn(device: Device) {
        device.isOn.toggle()
        save()
    }
    
    func save() {
        
    }
    
    func load() {
        
    }
}
