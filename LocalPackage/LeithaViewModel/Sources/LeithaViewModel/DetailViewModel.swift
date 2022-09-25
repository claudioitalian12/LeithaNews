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

// MARK: - DetailViewModel
/// DetailViewModel.
public class DetailViewModel: LeithaDetailViewModel, ObservableObject {
    /// news.
    private var newsID: Int
    /// news.
    private var news: DetailNews?
    /// appNavigator.
    public var appNavigator: AppNavigator?
    /// detailNews.
    @Published private var detailNews = Bool()
    // newsPublisher.
    public var detailNewsPublisher: Published<Bool>.Publisher { $detailNews }
    /// init.
    public init(id: Int) {
        self.newsID = id
    }
    // getDetailNew.
    @MainActor
    @discardableResult public func getDetailNews() async -> Bool {
        if let news = await LeithaNetwork().getDetail(with: newsID) {
            self.news = news
            detailNews = true
            return false
        } else {
            detailNews = false
            return false
        }
    }
    // getDetailTitle.
    public func getDetailTitle() -> String? {
        news?.message.title
    }
    // getDetailSubtitle.
    public func getDetailSubtitle() -> String? {
        news?.message.subtitle
    }
    // getDetailBody.
    public func getDetailBody() -> String? {
        news?.message.body
    }
    // getDetailDate.
    public func getDetailDate() -> String? {
        guard let timestamp = self.news?.message.timestamp else { return nil }
        return timestamp.dateFromTimestamp()
    }
}
