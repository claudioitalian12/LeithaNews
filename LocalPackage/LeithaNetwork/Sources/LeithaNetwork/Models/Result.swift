//
//  Result.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import Foundation

// MARK: - Result
public struct Result: Codable {
    public let id: Int
    public let title, subtitle: String?
    public let timestamp: Int?
    /// init.
    init(id: Int, title: String?, subtitle: String?, timestamp: Int?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.timestamp = timestamp
    }
}
