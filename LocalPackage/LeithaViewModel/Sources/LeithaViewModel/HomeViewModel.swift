//
//  LeithaViewModel.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews
import LeithaNetwork
import Foundation
import Combine

// MARK: - HomeViewModel
/// HomeViewModel.
public class HomeViewModel: LeithaHomeViewModel, ObservableObject {
    /// appNavigator.
    public var appNavigator: AppNavigator?
    /// limit.
    private var limit = 10
    /// offset.
    private var offset = 0
    /// news.
    private var news = [Result]()
    // isLoading.
    @Published private var isLoading = false
    // newsPublisher.
    public var newsPublisher: Published<Bool>.Publisher { $isLoading }
    /// init.
    public init() { }
    // getNumberOfSection.
    public func getNumberOfSection() -> Int {
        news.count == 0 ? 10:offset+10
    }
    // getNumberOfRow.
    public func getNumberOfRow() -> Int {
        1
    }
    // getNewsFromIndex.
    public func getcardNewsModelFromIndex(index: IndexPath) -> LeithaCardViewModel? {
        if news.count == 0 || index.section >= news.count {
            return nil
        } else {
            return CardViewModel(news: news[index.section])
        }
    }
    // getNews.
    @MainActor
    @discardableResult public func getNews() async -> Int {
        if isLoading == true { return offset }
        isLoading = true
        if let news = await LeithaNetwork().getNews(with: limit, offset: offset) {
            self.news.append(contentsOf: news)
            isLoading = false
            offset += 10
            return offset
        } else {
            isLoading = false
            return offset
        }
    }
}
