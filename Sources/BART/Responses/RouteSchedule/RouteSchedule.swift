//
//  RouteSchedule.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/12/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct RouteSchedule: Codable {
    enum CodingKeys: String, CodingKey {
        case trains = "train"
    }

    public let trains: [ScheduledTrain]
}
