//
//  Station.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/8/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct Station: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case abbreviation = "abbr"
        case latitude = "gtfs_latitude"
        case longitude = "gtfs_longitude"
        case address
        case city
        case county
        case state
        case postCode = "zipcode"
    }

    enum DecodingError: Error {
        case stringToBool(CodingKeys)
        case stringToDouble(CodingKeys)
        case stringToInt(CodingKeys)
    }

    public let name: String
    public let abbreviation: String
    public let latitude: Double
    public let longitude: Double
    public let address: String
    public let city: String
    public let county: String
    public let state: String
    public let postCode: String

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try values.decode(String.self, forKey: .name)
        self.abbreviation = try values.decode(String.self, forKey: .abbreviation)
        self.address = try values.decode(String.self, forKey: .address)
        self.city = try values.decode(String.self, forKey: .city)
        self.county = try values.decode(String.self, forKey: .county)
        self.state = try values.decode(String.self, forKey: .state)
        self.postCode = try values.decode(String.self, forKey: .postCode)

        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = true
        numberFormatter.numberStyle = .decimal

        self.latitude = try values.decode(Double.self, from: String.self, using: numberFormatter, forKey: .latitude)
        self.longitude = try values.decode(Double.self, from: String.self, using: numberFormatter, forKey: .longitude)
    }
}
