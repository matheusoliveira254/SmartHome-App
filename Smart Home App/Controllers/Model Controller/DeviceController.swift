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
    
    //MARK: - Persistence
    func save() {
        guard let url = devicesURL else {return}
        do {
            let data = try JSONEncoder().encode(devices)
            try data.write(to: url)
        } catch {
            print("Error Saving Devices", error)
        }
    }

    func load() {
        guard let url = devicesURL else {return}
        do{
            let data = try Data(contentsOf: url)
            let devices = try JSONDecoder().decode([Device].self, from: data)
            self.devices = devices
        } catch {
            print("Error Loading devices", error)
        }
    }
    
    private var devicesURL: URL? {
        //Computed Property
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let url = documentsDirectory.appendingPathComponent("devices.json")
        return url
    }
}
