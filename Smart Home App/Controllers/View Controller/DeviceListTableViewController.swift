//
//  DeviceListTableViewController.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import UIKit

class DeviceListTableViewController: UITableViewController {

    //MARK: - Properties
//    let shared = DeviceController.sharedInstance
    var deviceController: DeviceController!
    var fileName: String?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.deviceController = DeviceController(fileName: fileName ?? "defaultRoom.json")
        NotificationCenter.default.addObserver(self, selector: #selector(turnAllDevicesOn), name: TurnOnAllNotificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(turnAllDevicesOff), name: TurnOffAllNotificationName, object: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceController.devices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else {return UITableViewCell()}
        let device = deviceController.devices[indexPath.row]
        cell.updateViews(device: device)
        cell.delegate = self
        return cell
    }

//     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let device = deviceController.devices[indexPath.row]
            deviceController.delete(deviceToBeDeleted: device)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: - Methods
    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Enter the name of your device below", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "New Device Name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Create", style: .default) { _ in
            guard let contentTextField = alertController.textFields?.first,
                  let name = contentTextField.text else {return}
            self.deviceController.create(name: name)
            self.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    @objc func turnAllDevicesOn() {
        deviceController.toggleAllDevicesOn(on: true)
        tableView.reloadData()
    }
    
    @objc func turnAllDevicesOff() {
        deviceController.toggleAllDevicesOn(on: false)
        tableView.reloadData()
    }

    //MARK: - IBAction
    @IBAction func addDeviceBarButtonItem(_ sender: UIBarButtonItem) {
        presentNewDeviceAlertController()
    }
}// End of class

extension DeviceListTableViewController: DeviceTableViewCellDelegate {
    func isOnSwitchedToggled(cell: DeviceTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let index = deviceController.devices[indexPath.row]
        deviceController.toggleIsOn(device: index)
        cell.updateViews(device: index)
    }
}
