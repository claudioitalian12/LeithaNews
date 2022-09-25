//
//  Message.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import Foundation

// MARK: - Message
public struct Message: Codable {
    public let results: [Result]
    public let size: Int
    public let parameters: Parameters
    /// init.
    init(results: [Result], size: Int, parameters: Parameters) {
        self.results = results
        self.size = size
        self.parameters = parameters
    }
}
