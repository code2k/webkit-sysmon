//
//  System.swift
//  webkit-sysmon
//
//  Created by Andreas Pataki on 06.05.18.
//  Copyright © 2018 CODE2K:LABS. All rights reserved.
//

import Foundation
import SystemKit

struct SystemData: Codable {
    var model: String?
}

class SystemHelper {

    static func get() -> SystemData {
        var data = SystemData()
        data.model = System.modelName()
        return data
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
