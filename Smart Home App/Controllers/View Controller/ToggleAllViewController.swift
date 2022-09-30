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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func turnAllOnButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: TurnOnAllNotificationName, object: nil)
    }
    @IBAction func turnAllOffButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: TurnOffAllNotificationName, object: nil)
    }
    
}
