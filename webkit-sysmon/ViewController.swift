//
//  ViewController.swift
//  webkit-sysmon
//
//  Created by Andreas Pataki on 06.05.18.
//  Copyright © 2018 CODE2K:LABS. All rights reserved.
//

import Cocoa
import SystemKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let memoryUsage = System.memoryUsage()
        func memoryUnit(_ value: Double) -> String {
            if value < 1.0 { return String(Int(value * 1000.0))    + "MB" }
            else           { return NSString(format:"%.2f", value) as String + "GB" }
        }

        print("\tFREE:            \(memoryUnit(memoryUsage.free))")
        print("\tWIRED:           \(memoryUnit(memoryUsage.wired))")
        print("\tACTIVE:          \(memoryUnit(memoryUsage.active))")
        print("\tINACTIVE:        \(memoryUnit(memoryUsage.inactive))")
        print("\tCOMPRESSED:      \(memoryUnit(memoryUsage.compressed))")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

