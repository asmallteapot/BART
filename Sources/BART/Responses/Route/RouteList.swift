import Foundation

public struct RouteList: Codable {
	enum CodingKeys: String, CodingKey {
		case routes = "route"
	}

	public let routes: [Route]
}
