//
//  KeyedDecodingContainer.swift
//  Arrivals
//
//  Created by Ellen Teapot on 5/11/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    enum DecodingError: Error {
        case stringToBool(KeyedDecodingContainer.Key)
        case stringToDouble(KeyedDecodingContainer.Key)
        case stringToInt(KeyedDecodingContainer.Key)
    }

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
