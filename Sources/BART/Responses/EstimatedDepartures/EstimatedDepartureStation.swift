//
//  EstimatedDepartureStation.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/8/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct EstimatedDepartureStation: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case abbreviation = "abbr"
        case destinations = "etd"
    }

    public let name: String
    public let abbreviation: String
    public let destinations: [EstimatedDepartureDestination]
}
