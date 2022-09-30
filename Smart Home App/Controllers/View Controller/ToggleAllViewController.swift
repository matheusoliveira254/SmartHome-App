//
//  ToggleAllViewController.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import UIKit

let TurnOnAllNotificationName = Notification.Name(rawValue: "TurnOnAllDevicesNotification")
let TurnOffAllNotificationName = Notification.Name(rawValue: "TurnOffAllDevicesNotification")

class ToggleAllViewController: UIViewController {
    
    @IBAction func turnAllOnButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: TurnOnAllNotificationName, object: nil)
    }
    @IBAction func turnAllOffButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: TurnOffAllNotificationName, object: nil)
    }
    
}
