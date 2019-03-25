import Foundation

/// A station in the BART system.
public struct Station: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case abbreviation = "abbr"
        case latitude = "gtfs_latitude"
        case longitude = "gtfs_longitude"
        case address
        case city
        case county
        case state
        case postCode = "zipcode"
    }

    /// The name of the station.
    public let name: String

    /// The internal station code.
    public let abbreviation: String

    /// The station's latitude.
    public let latitude: Double

    /// The station's longitude.
    public let longitude: Double

    /// The station's street address.
    public let address: String

    /// The city the station is located in.
    public let city: String

    /// The county the station is located in.
    public let county: String

    /// The state the station is located in.
    /// - Note: Yes, BART is ambitious enough to include a field for this.
    public let state: String

    /// The station's postal code.
    public let postCode: String

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try values.decode(String.self, forKey: .name)
        self.abbreviation = try values.decode(String.self, forKey: .abbreviation)
        self.address = try values.decode(String.self, forKey: .address)
        self.city = try values.decode(String.self, forKey: .city)
        self.county = try values.decode(String.self, forKey: .county)
        self.state = try values.decode(String.self, forKey: .state)
        self.postCode = try values.decode(String.self, forKey: .postCode)

        let numberFormatter = NumberFormatter()
        numberFormatter.allowsFloats = true
        numberFormatter.numberStyle = .decimal

        self.latitude = try values.decode(Double.self, from: String.self, using: numberFormatter, forKey: .latitude)
        self.longitude = try values.decode(Double.self, from: String.self, using: numberFormatter, forKey: .longitude)
    }
}
