import Foundation

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

	public let name: String
	public let abbreviation: String
	public let routeIdentifier: String
	public let number: String
	public let origin: String
	public let destination: String
	public let direction: String
	public let hexColor: String
	public let color: String
	public let holidays: String
	public let numberOfStations: String
	public let configuration: RouteConfiguration
}
