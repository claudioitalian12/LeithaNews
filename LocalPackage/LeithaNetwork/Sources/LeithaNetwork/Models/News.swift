//
//  News.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import Foundation

// MARK: - News
public struct News: Codable {
    public let message: Message
    /// init with data.
    init(data: Data) throws {
        self = try JSONDecoder().decode(News.self, from: data)
    }
    /// init with message.
    init(message: Message) {
        self.message = message
    }
}
