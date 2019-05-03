import Foundation

/// TODO: Fold into `Route`.
public struct RouteConfiguration: Codable {
	enum CodingKeys: String, CodingKey {
		case stops = "station"
	}

    /// A list of station codes served by a route.
	public let stops: [String]
}
