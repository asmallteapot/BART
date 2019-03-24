import Foundation

/// Response containing the estimated departures for a list of stations.
public struct EstimatedDeparturesResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case stations = "station"
        case message
    }

    /// The estimated departures for each station.
    public let stations: [EstimatedDepartureStation]

    /// An optional response message.
    public let message: String?
}
