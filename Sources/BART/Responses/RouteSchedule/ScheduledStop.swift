import Foundation

/// A train's scheduled stop on a route.
public struct ScheduledStop: Codable {
    enum CodingKeys: String, CodingKey {
        case station = "@station"
        case load = "@load"
        case level = "@level"
        case departureTime = "@origTime"
        case bikesAllowed = "@bikeflag"
    }

    /// The station code of the scheduled stop.
    public let station: String

    /// The predicted load level of the train at this stop.
    public let load: String

    /// The predicted load level of the train at this stop.
    public let level: String

    /// The estimated departure time.
    public let departureTime: String?

    /// Indicates whether bikes are allowed on this train.
    public let bikesAllowed: Bool

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.station = try values.decode(String.self, forKey: .station)
        self.load = try values.decode(String.self, forKey: .load)
        self.level = try values.decode(String.self, forKey: .level)

        if values.contains(.departureTime) {
            self.departureTime = try values.decode(String.self, forKey: .departureTime)
        } else {
            self.departureTime = nil
        }

        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = false
        numberFormatter.numberStyle = .none

        self.bikesAllowed = try values.decode(Bool.self,
                                              from: String.self,
                                              using: numberFormatter,
                                              forKey: .bikesAllowed)
    }
}
