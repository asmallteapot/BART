//
//  EstimatedDepartureTime.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/8/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct EstimatedDepartureTime: Codable {
    enum CodingKeys: String, CodingKey {
        case minutes
        case platform
        case direction
        case length
        case color
        case hexColor = "hexcolor"
        case bikesAllowed = "bikeflag"
        case delay
    }

    /// The number of minutes until the train departs.
    public let minutes: Int

    /// The platform the train will arrive at.
    public let platform: Int

    /// The direction the train will travel.
    public let direction: String

    /// The number of cars on the train.
    public let length: Int

    public let color: String
    public let hexColor: String

    /// Indicates whether bikes are allowed on the train.
    public let bikesAllowed: Bool

    /// The number of seconds the train is delayed.
    public let delay: Int

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = false
        numberFormatter.numberStyle = .none

        do {
            // future-proof for typed JSON from BART API
            self.minutes = try values.decode(Int.self, forKey: .minutes)
        } catch {
            let minutesString = try values.decode(String.self, forKey: .minutes)
            if let minutes = numberFormatter.int(from: minutesString) {
                self.minutes = minutes
            } else if minutesString.lowercased() == "leaving" {
                self.minutes = 0
            } else {
                throw KeyedDecodingContainer.DecodingError.stringToInt(CodingKeys.minutes)
            }
        }

        self.platform = try values.decode(Int.self, from: String.self, using: numberFormatter, forKey: .platform)
        self.direction = try values.decode(String.self, forKey: .direction)
        self.length = try values.decode(Int.self, from: String.self, using: numberFormatter, forKey: .length)
        self.color = try values.decode(String.self, forKey: .color)
        self.hexColor = try values.decode(String.self, forKey: .hexColor)
        self.bikesAllowed = try values.decode(Bool.self,
                                              from: String.self,
                                              using: numberFormatter,
                                              forKey: .bikesAllowed)
        self.delay = try values.decode(Int.self, from: String.self, using: numberFormatter, forKey: .delay)
    }
}
