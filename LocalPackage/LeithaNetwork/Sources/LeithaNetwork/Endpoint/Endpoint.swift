//
//  Endpoint.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import Foundation

// MARK: - Endpoint
/// Endpoint.
public enum Endpoint {
    case getNews(limit: Int, offset: Int)
    case getDetail(id: Int)
}
// MARK: - extension Endpoint
extension Endpoint {
    /// base.
    public var base: String {
        switch self {
        case .getNews, .getDetail:
            return "https://aewvdpjnii.execute-api.eu-central-1.amazonaws.com"
        }
    }
    /// path.
    public var path: String {
        switch self {
        case .getNews:
            return "/dev/news"
        case .getDetail(let id):
            return "/dev/news/\(id)"
        }
    }
    /// queryItems.
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .getNews(let limit, let offset):
            return [
                URLQueryItem(name: "limit", value: String(limit)),
                URLQueryItem(name: "offset", value: String(offset))
            ]
        case .getDetail:
            return nil
        }
    }
    /// headerParams.
    public var headerParams: (String,String) {
        switch self {
        case .getNews, .getDetail:
            return ("B1Ryz3vdoW5E2VvbLSCKo7MhWoGXJmgY2TrPikRe","x-api-key")
        }
    }
    /// urlComponents.
    public var urlComponents: URLComponents? {
        var components = URLComponents(string: base)
        components?.path = path
        components?.queryItems = queryItems
        return components
    }
    /// request.
    public var request: URLRequest? {
        guard let url = urlComponents?.url else { return nil }
        var request = URLRequest(url: url)
        request.setValue(headerParams.0, forHTTPHeaderField: headerParams.1)
        return request
    }
    /// url.
    public var url: URL? {
        urlComponents?.url
    }
}
