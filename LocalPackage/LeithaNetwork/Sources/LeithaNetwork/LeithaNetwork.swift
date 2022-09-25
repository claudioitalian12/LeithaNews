import UIKit

// MARK: - LeithaNetwork
/// LeithaNetwork.
public class LeithaNetwork {
    /// init.
    public init() {}
    /// getNews.
    public func getNews(with limit: Int, offset: Int) async -> [Result]? {
        guard let urlRequest = Endpoint.getNews(limit: limit, offset: offset).request else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            let news = try News.init(data: data)
            return news.message.results
        }
        catch {
            return nil
        }
    }
    /// getDetail.
    public func getDetail(with id: Int) async -> DetailNews? {
        guard let urlRequest = Endpoint.getDetail(id: id).request else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let detailNews = try DetailNews.init(data: data)
            return detailNews
        }
        catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
