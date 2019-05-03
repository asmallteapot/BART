import Foundation

/// The schedule for a specific route.
public struct RouteSchedule: Codable {
    enum CodingKeys: String, CodingKey {
        case trains = "train"
    }

    /// The list of scheduled trains.
    public let trains: [ScheduledTrain]
}
