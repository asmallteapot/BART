import Foundation

/// The estimated departures from a specific station.
public struct EstimatedDepartureStation: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case abbreviation = "abbr"
        case destinations = "etd"
    }

    /// The name of the origin station for these departures.
    public let name: String

    /// The station code of the origin station.
    public let abbreviation: String

    /// The estimated departures for each destination.
    public let destinations: [EstimatedDepartureDestination]
}
