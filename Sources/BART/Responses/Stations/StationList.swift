import Foundation

/// TODO: Fold into `StationsResponse`?
public struct StationList: Codable {
    enum CodingKeys: String, CodingKey {
        case stations = "station"
    }

    /// A list of `Station` values.
    public let stations: [Station]
}
