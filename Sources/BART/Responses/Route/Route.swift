import Foundation

/// A route is a single direction of a BART line.
public struct Route: Codable {
	enum CodingKeys: String, CodingKey {
		case name = "name"
		case abbreviation = "abbr"
		case routeIdentifier = "routeID"
		case number = "number"
		case origin = "origin"
		case destination = "destination"
		case direction = "direction"
		case hexColor = "hexcolor"
		case color = "color"
		case holidays = "holidays"
		case numberOfStations = "num_stns"
		case configuration = "config"
	}

    /// The name of the route.
	public let name: String

    /// The abbreviations of the route's origin and final stations.
	public let abbreviation: String

    /// The route's identifier.
	public let routeIdentifier: String

    /// The route's number.
	public let number: String

    /// The station code of the route's origin station.
	public let origin: String

    /// The station code of the route's final station.
	public let destination: String

    /// The direction the route travels.
	public let direction: String

    /// The route's hex color code.
	public let hexColor: String

    /// The route's color name, e.g. 'YELLOW' for the Yellow Line.
	public let color: String

    /// Indicates whether the route runs on holidays.
	public let holidays: String

    /// The number of stations on the route.
	public let numberOfStations: String

    /// The stops made on the route.
	public let configuration: RouteConfiguration
}
