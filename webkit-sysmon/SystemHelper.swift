//
// Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation
import SystemKit

struct SystemData: Codable {
    let model: String
    let physicalCores: Int
    let logicalCores: Int
    let processCount: Int
    let threadCount: Int
    let loadAverage: [String]

    let usage = SystemUsage()
    let memory = SystemMemory()
    let uptime = SystemUptime()

    var battery: SystemBattery?

    init() {
        model = System.modelName()
        physicalCores = System.physicalCores()
        logicalCores = System.logicalCores()

        let counts = System.processCounts()
        processCount = counts.processCount
        threadCount = counts.threadCount

        loadAverage = System.loadAverage().map { String(format:"%.2f", $0) }

        var battery = Battery()
        if battery.open() == kIOReturnSuccess {
            self.battery = SystemBattery(battery)
            _ = battery.close()
        }

    }
}

struct SystemMemory: Codable {
    let free: String
    let wired: String
    let active: String
    let inactive: String
    let compressed: String

    init() {
        let memoryUsage = System.memoryUsage()
        func memoryUnit(_ value: Double) -> String {
            if value < 1.0 { return String(Int(value * 1000.0))    + " MB" }
            else           { return NSString(format:"%.2f", value) as String + " GB" }
        }

        free = memoryUnit(memoryUsage.free)
        wired = memoryUnit(memoryUsage.wired)
        active = memoryUnit(memoryUsage.active)
        inactive = memoryUnit(memoryUsage.inactive)
        compressed = memoryUnit(memoryUsage.compressed)
    }
}

struct SystemUptime: Codable {
    let days: Int
    let hours: Int
    let minutes: Int
    let seconds: Int

    init() {
        let uptime = System.uptime()
        days = uptime.days
        hours = uptime.hrs
        minutes = uptime.mins
        seconds = uptime.secs
    }

}

struct SystemUsage: Codable {
    let system: Int
    let user: Int
    let idle: Int
    let nice: Int

    static var sys = System()

    init() {
        let cpuUsage = SystemUsage.sys.usageCPU()
        system = Int(cpuUsage.system)
        user = Int(cpuUsage.user)
        idle = Int(cpuUsage.idle)
        nice = Int(cpuUsage.nice)
    }
}

struct SystemBattery: Codable {
    let isACPowered: Bool
    let isCharged: Bool
    let isCharging: Bool
    let charge: Double
    let currentCapacity: Int
    let maxCapactiy: Int
    let designCapacity: Int
    let cycleCount: Int
    let designCycleCount: Int
    let temperature: Double
    let timeRemainingFormatted: String

    init(_ battery: Battery) {
        isACPowered = battery.isACPowered()
        isCharged = battery.isCharged()
        isCharging = battery.isCharging()
        charge = battery.charge()
        currentCapacity = battery.currentCapacity()
        maxCapactiy = battery.maxCapactiy()
        designCapacity = battery.designCapacity()
        cycleCount = battery.cycleCount()
        designCycleCount = battery.designCycleCount()
        temperature = battery.temperature()
        timeRemainingFormatted = battery.timeRemainingFormatted()
    }

}

class SystemHelper {

    static func get() -> SystemData {
        return SystemData()
    }

    static func getJSON() -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData: Data
        do {
            jsonData = try jsonEncoder.encode(SystemHelper.get())
        } catch {
            NSLog("Error encoding json \(error)")
            return "{ error: \"\(error)\"}"
        }
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            return "{ error: \"Error creating string\"}"
        }
        return jsonString
    }

}
