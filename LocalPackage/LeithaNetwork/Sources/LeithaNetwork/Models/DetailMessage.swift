//
//  DetailMessage.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import Foundation

// MARK: - Message
public struct DetailMessage: Codable {
    public let id: Int
    public let title, subtitle, body: String
    public let timestamp: Int
    /// init.
    init(id: Int, title: String, subtitle: String, body: String, timestamp: Int) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.body = body
        self.timestamp = timestamp
    }
}
