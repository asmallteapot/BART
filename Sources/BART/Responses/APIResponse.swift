import Foundation

/// Wrapper value for all BART API responses.
public struct APIResponse<T: Codable>: Codable {
	enum CodingKeys: String, CodingKey {
		case root
	}

    /// The root value.
	public let root: T
}
