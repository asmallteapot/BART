import Foundation

/// The estimated departures toward a specific destination.
public struct EstimatedDepartureDestination: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "destination"
        case abbreviation
        case limited
        case departureTimes = "estimate"
    }

    /// The name of the destination.
    public let name: String

    /// The station code of the destination.
    public let abbreviation: String

    /// If `true`, the departures to this destination
    public let limited: Bool

    /// The estimated departure times for this destination.
    public let departureTimes: [EstimatedDepartureTime]

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try values.decode(String.self, forKey: .name)
        self.abbreviation = try values.decode(String.self, forKey: .abbreviation)

        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = false
        numberFormatter.numberStyle = .none

        self.limited = try values.decode(Bool.self, from: String.self, using: numberFormatter, forKey: .limited)
        self.departureTimes = try values.decode([EstimatedDepartureTime].self, forKey: .departureTimes)
    }
}
