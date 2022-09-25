//
//  DetailNews.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import Foundation

// MARK: - DetailNews
public struct DetailNews: Codable {
    public let message: DetailMessage
    /// init with data.
    init(data: Data) throws {
        self = try JSONDecoder().decode(DetailNews.self, from: data)
    }
    // init.
    init(message: DetailMessage) {
        self.message = message
    }
}
