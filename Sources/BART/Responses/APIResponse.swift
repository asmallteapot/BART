import Foundation

public struct APIResponse<T: Codable>: Codable {
	enum CodingKeys: String, CodingKey {
		case root
	}

	public let root: T
}
