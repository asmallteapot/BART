//
//  RouteScheduleResponse.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/11/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct RouteScheduleResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case schedule = "route"
        case message
    }

    public let schedule: RouteSchedule
    public let message: [String: [String: String]]?
}
