//
//  DeviceController.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import Foundation

class DeviceController {
    
    //MARK: - Properties
//    static let sharedInstance = DeviceController()
    private let fileName: String
    private(set) var devices: [Device] = []
    
    //MARK: - Initializers
    init(fileName: String) {
        self.fileName = fileName
        load()
    }
    
    //MARK: - Methods
    func toggleAllDevicesOn(on: Bool = true) {
        devices.forEach {$0.isOn = on}
        save()
    }
    
    func toggleAllDevicesOff() {
        devices.forEach {$0.isOn = false}
        save()
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
    
    func delete(deviceToBeDeleted: Device) {
        guard let index = devices.firstIndex(of: deviceToBeDeleted) else {return}
        devices.remove(at: index)
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
