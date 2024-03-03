//
//  ViewController.swift
//  DeviceInfo
//
//  Created by ROHIT DAS on 03/03/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(detailsLabel)

        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])

        // Set the device details
        detailsLabel.text = UIDevice.deviceDetails
    }

}




extension UIDevice {
    static var deviceDetails: String {
        var details = ""
        

        // Device Model
        details += "Model: \(UIDevice.current.model)\n"

        // iOS Version
        details += "iOS Version: \(UIDevice.current.systemVersion)\n"

        // Device's Serial Number
        if let identifierForVendor = UIDevice.current.identifierForVendor {
            details += "Serial Number: \(identifierForVendor.uuidString)\n"
        }

        // Storage
        if let totalSpace = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemSize] as? Int,
           let freeSpace = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemFreeSize] as? Int {
            details += "Total Storage: \(totalSpace / (1024 * 1024 * 1024)) GB\n"
            details += "Free Storage: \(freeSpace / (1024 * 1024 * 1024)) GB\n"
        }

        // Battery Level (Current charging level)
        let batteryLevel = UIDevice.current.batteryLevel * 100
        details += "Battery Level: \(Int(batteryLevel))%\n"
        
        
        // Processor (CPU) Information
        details += "Processor (CPU): \(UIDevice.current.processorInfo())\n"


        return details
    }
}

extension UIDevice {
    func processorInfo() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}
