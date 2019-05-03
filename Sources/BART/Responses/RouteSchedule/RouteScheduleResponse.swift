import Foundation

/// Response containing a route schedule.
public struct RouteScheduleResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case schedule = "route"
        case message
    }

    /// The route schedule from the response.
    public let schedule: RouteSchedule

    /// An optional response message.
    public let message: [String: [String: String]]?
}
