//
//  ScheduledTrain.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/12/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct ScheduledTrain: Codable {
    enum CodingKeys: String, CodingKey {
        case identifier = "@trainId"
        case trainIndex = "@trainIdx"
        case index = "@index"
        case stops = "stop"
    }

    public let identifier: String
    public let trainIndex: String
    public let index: String
    public let stops: [ScheduledStop]
}
