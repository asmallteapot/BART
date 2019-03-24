import Foundation

/// A scheduled train on a route.
public struct ScheduledTrain: Codable {
    enum CodingKeys: String, CodingKey {
        case identifier = "@trainId"
        case trainIndex = "@trainIdx"
        case index = "@index"
        case stops = "stop"
    }

    /// The train's identifier.
    public let identifier: String

    /// The train's index.
    public let trainIndex: String

    /// The train's index.
    public let index: String

    /// The train's scheduled stops.
    public let stops: [ScheduledStop]
}
