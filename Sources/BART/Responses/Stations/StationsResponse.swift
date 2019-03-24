import Foundation

/// Response containing the list of stations in the BART system.
public struct StationsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case stations
        case message
    }

    /// The list of stations in the BART system.
    public let stations: StationList

    /// An optional response message.
    public let message: String?
}
