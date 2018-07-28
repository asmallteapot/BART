//
//  NumberFormatter.swift
//  Arrivals
//
//  Created by Ellen Teapot on 2/18/18.
//  Copyright © 2018 Ellen Teapot. All rights reserved.
//

import Foundation

extension NumberFormatter {
    public func bool(from string: String) -> Bool? {
        return self.number(from: string)?.boolValue
    }

    public func double(from string: String) -> Double? {
        return self.number(from: string)?.doubleValue
    }

    public func int(from string: String) -> Int? {
        return self.number(from: string)?.intValue
    }
}
