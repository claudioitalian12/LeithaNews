//
//  Parameters.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import Foundation

// MARK: - Parameters
public struct Parameters: Codable {
    public let limit, offset: String
    /// init.
    init(limit: String, offset: String) {
        self.limit = limit
        self.offset = offset
    }
}
