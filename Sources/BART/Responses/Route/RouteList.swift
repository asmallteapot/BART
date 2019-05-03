import Foundation

/// TODO: Fold into `RouteResponse`?
public struct RouteList: Codable {
	enum CodingKeys: String, CodingKey {
		case routes = "route"
	}

    /// A list of `Route` values.
	public let routes: [Route]
}
