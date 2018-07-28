//
//  EstimatedDepartureDestination.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/8/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct EstimatedDepartureDestination: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "destination"
        case abbreviation
        case limited
        case departureTimes = "estimate"
    }

    public let name: String
    public let abbreviation: String
    public let limited: Bool
    public let departureTimes: [EstimatedDepartureTime]

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try values.decode(String.self, forKey: .name)
        self.abbreviation = try values.decode(String.self, forKey: .abbreviation)

        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = false
        numberFormatter.numberStyle = .none

        self.limited = try values.decode(Bool.self, from: String.self, using: numberFormatter, forKey: .limited)
        self.departureTimes = try values.decode([EstimatedDepartureTime].self, forKey: .departureTimes)
    }
}
