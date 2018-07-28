//
//  EstimatedDeparturesResponse.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/8/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//
import Foundation

public struct EstimatedDeparturesResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case stations = "station"
        case message
    }

    public let stations: [EstimatedDepartureStation]
    public let message: String?
}
