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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//MARK: - IBAction
    @IBAction func isOnDeviceSwitch(_ sender: UISwitch) {
    }
    
}
