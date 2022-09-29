//
//  DeviceTableViewCell.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
//MARK: - IBOutlets
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var isOnDevice: UISwitch!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - Methods
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        isOnDevice.isOn = device.isOn
    }
//MARK: - IBAction
    @IBAction func isOnDeviceSwitch(_ sender: UISwitch) {
    }
}
