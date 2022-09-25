//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 24/09/22.
//

import Foundation
import BaseLeithaNews
import LeithaNetwork

// MARK: - CardViewModel
/// CardViewModel.
public class CardViewModel: LeithaCardViewModel {
    /// news.
    private var news: Result?
    /// getNumberNews.
    public func getNumberNews() -> String? {
        guard let id = self.news?.id else { return nil }
        
        return "News numero \(id + 1)"
    }
    /// getTitleNews.
    public func getTitleNews() -> String? {
        self.news?.title
    }
    /// getDateNews.
    public func getDateNews() -> String? {
        guard let timestamp = self.news?.timestamp else { return nil }
        return timestamp.dateFromTimestamp()
    }
    /// news: Codable?.
    required public init(news: Codable?) {
        self.news = news as? Result
    }
}
