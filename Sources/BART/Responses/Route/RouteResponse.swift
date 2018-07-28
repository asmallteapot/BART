import Foundation

public struct RouteResponse: Codable {
	enum CodingKeys: String, CodingKey {
		case scheduleNumber = "sched_num"
		case routes
		case message = "message"
	}

	public let scheduleNumber: String
	public let routes: RouteList
	public let message: String?
}
