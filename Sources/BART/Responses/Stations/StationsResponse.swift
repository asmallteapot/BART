//
//  StationsResponse.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/8/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct StationsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case stations
        case message
    }

    public let stations: StationList
    public let message: String?
}
