//
//  DeviceListTableViewController.swift
//  Smart Home App
//
//  Created by Matheus Oliveira on 9/29/22.
//

import UIKit

class DeviceListTableViewController: UITableViewController {
    //MARK: - IBOutlets

    
    //MARK: - Properties
    let shared = DeviceController.sharedInstance
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return shared.devices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else {return UITableViewCell()}
        let device = shared.devices[indexPath.row]
        cell.updateViews(device: device)
        cell.delegate = self
        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    //MARK: - Methods
    func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Enter the name of your device below", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "New Device Name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Create", style: .default) { _ in
            guard let contentTextField = alertController.textFields?.first,
                  let name = contentTextField.text else {return}
            self.shared.create(name: name)
            self.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }

    //MARK: - IBAction
    @IBAction func addDeviceBarButtonItem(_ sender: UIBarButtonItem) {
        presentNewDeviceAlertController()
    }
}// End of class

extension DeviceListTableViewController: DeviceTableViewCellDelegate {
    func isOnSwitchedToggled(cell: DeviceTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let index = shared.devices[indexPath.row]
        shared.toggleIsOn(device: index)
        cell.updateViews(device: index)
    }
}
