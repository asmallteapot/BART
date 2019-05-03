import Foundation

/// Swift convenience wrappers around `NSNumber`
extension NumberFormatter {
    /// Returns a `Bool?` value created by parsing a given string.
    public func bool(from string: String) -> Bool? {
        return self.number(from: string)?.boolValue
    }

    /// Returns a `Double?` value created by parsing a given string.
    public func double(from string: String) -> Double? {
        return self.number(from: string)?.doubleValue
    }

    /// Returns an `Int?` value created by parsing a given string.
    public func int(from string: String) -> Int? {
        return self.number(from: string)?.intValue
    }
}
