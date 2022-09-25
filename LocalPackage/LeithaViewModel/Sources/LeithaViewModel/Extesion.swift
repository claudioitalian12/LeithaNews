//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 24/09/22.
//

import Foundation

// MARK: - extension Int
extension Int {
    /// dateFromTimestamp.
    func dateFromTimestamp() -> String {
        let dateFromServer = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: dateFromServer)
    }
}
