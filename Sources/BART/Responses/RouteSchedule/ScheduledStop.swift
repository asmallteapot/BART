//
//  ScheduledStop.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/12/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct ScheduledStop: Codable {
    enum CodingKeys: String, CodingKey {
        case station = "@station"
        case load = "@load"
        case level = "@level"
        case departureTime = "@origTime"
        case bikesAllowed = "@bikeflag"
    }

    public let station: String
    public let load: String
    public let level: String
    public let departureTime: String?
    public let bikesAllowed: Bool

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.station = try values.decode(String.self, forKey: .station)
        self.load = try values.decode(String.self, forKey: .load)
        self.level = try values.decode(String.self, forKey: .level)

        if values.contains(.departureTime) {
            self.departureTime = try values.decode(String.self, forKey: .departureTime)
        } else {
            self.departureTime = nil
        }

        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = false
        numberFormatter.numberStyle = .none

        self.bikesAllowed = try values.decode(Bool.self,
                                              from: String.self,
                                              using: numberFormatter,
                                              forKey: .bikesAllowed)
    }
}
