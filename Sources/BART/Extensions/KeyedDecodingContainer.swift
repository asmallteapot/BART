import Foundation

/// Methods for decoding numeric values from strings
extension KeyedDecodingContainer {
    /// Enumeration of possible decoding errors in this extension
    enum DecodingError: Error {
        /// Failed to decode a Bool from a String
        case stringToBool(KeyedDecodingContainer.Key)
        /// Failed to decode a Double from a String
        case stringToDouble(KeyedDecodingContainer.Key)
        /// Failed to decode an Int from a String
        case stringToInt(KeyedDecodingContainer.Key)
    }

    /// Attempts to decode a `Bool` from a `String` using a `NumberFormatter`.
    public func decode(
        _ type: Bool.Type,
        from fromType: String.Type,
        using numberFormatter: NumberFormatter,
        forKey key: KeyedDecodingContainer.Key
    ) throws -> Bool {
        do {
            return try self.decode(type, forKey: key)
        } catch {
            let valueString = try self.decode(fromType, forKey: key)
            if let value = numberFormatter.bool(from: valueString) {
                return value
            } else {
                throw DecodingError.stringToBool(key)
            }
        }
    }

    /// Attempts to decode a `Double` from a `String` using a `NumberFormatter`.
    public func decode(
        _ type: Double.Type,
        from fromType: String.Type,
        using numberFormatter: NumberFormatter,
        forKey key: KeyedDecodingContainer.Key
    ) throws -> Double {
        do {
            return try self.decode(type, forKey: key)
        } catch {
            let valueString = try self.decode(fromType, forKey: key)
            if let value = numberFormatter.double(from: valueString) {
                return value
            } else {
                throw DecodingError.stringToDouble(key)
            }
        }
    }

    /// Attempts to decode an `Int` from a `String` using a `NumberFormatter`.
    public func decode(
        _ type: Int.Type,
        from fromType: String.Type,
        using numberFormatter: NumberFormatter,
        forKey key: KeyedDecodingContainer.Key
    ) throws -> Int {
        do {
            return try self.decode(type, forKey: key)
        } catch {
            let valueString = try self.decode(fromType, forKey: key)
            if let value = numberFormatter.int(from: valueString) {
                return value
            } else {
                throw DecodingError.stringToInt(key)
            }
        }
    }
}
