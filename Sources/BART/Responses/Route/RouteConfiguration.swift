import Foundation

public struct RouteConfiguration: Codable {
	enum CodingKeys: String, CodingKey {
		case stops = "station"
	}

	public let stops: [String]
}
