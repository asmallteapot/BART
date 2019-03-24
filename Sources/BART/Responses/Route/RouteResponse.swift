import Foundation

/// Response containing the list of routes for a schedule.
public struct RouteResponse: Codable {
	enum CodingKeys: String, CodingKey {
		case scheduleNumber = "sched_num"
		case routes
		case message = "message"
	}

    /// The schedule number for the provided routes.
	public let scheduleNumber: String

    /// The list of routes for the schedule.
	public let routes: RouteList

    /// An optional response message.
	public let message: String?
}
