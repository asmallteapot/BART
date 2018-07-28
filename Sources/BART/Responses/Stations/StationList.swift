//
//  StationList.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/8/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

public struct StationList: Codable {
    enum CodingKeys: String, CodingKey {
        case stations = "station"
    }

    public let stations: [Station]
}
