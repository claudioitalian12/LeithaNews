import XCTest
@testable import LeithaNetwork

final class LeithaNetworkTests: XCTestCase {
    /// endpoint.
    let endpoint = Endpoint.getNews(limit: 0, offset: 0)
    /// urlSession.
    var urlSession: URLSession!
    /// setUpWithError.
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }
    /// testEndpointBase.
    func testEndpointBase() throws {
        XCTAssertEqual(
            endpoint.base,
            "https://aewvdpjnii.execute-api.eu-central-1.amazonaws.com"
        )
    }
    /// testEndpointPath.
    func testEndpointPath() throws {
        XCTAssertEqual(
            endpoint.path,
            "/dev/news"
        )
    }
    /// testEndpointQueryItems.
    func testEndpointQueryItems() throws {
        XCTAssertEqual(
            endpoint.queryItems,
            [URLQueryItem(
                name: "limit", value: "0"),
             URLQueryItem(name: "offset", value: "0")
            ]
        )
    }
    /// testEndpointHeaderParams.
    func testEndpointHeaderParams() throws {
        XCTAssertEqual(
            endpoint.headerParams.0,
            "B1Ryz3vdoW5E2VvbLSCKo7MhWoGXJmgY2TrPikRe"
        )
        XCTAssertEqual(
            endpoint.headerParams.1,
            "x-api-key"
        )
    }
    /// testEndpointUrlComponents.
    func testEndpointUrlComponents() throws {
        XCTAssertNotNil(endpoint.urlComponents)
    }
    /// testEndpointRequest.
    func testEndpointRequest() throws {
        XCTAssertNotNil(endpoint.request)
    }
    /// testEndpointURL.
    func testEndpointURL() throws {
        XCTAssertNotNil(endpoint.url)
    }
    /// testMessageInit.
    func testMessageInit() throws {
        let message = Message(
            results: [],
            size: 0,
            parameters: Parameters(
                limit: "",
                offset: ""
            )
        )
        XCTAssertEqual(message.size, 0)
        XCTAssertEqual(message.parameters.limit, "")
        XCTAssertEqual(message.parameters.offset, "")
    }
    /// testNewsInit.
    func testNewsInit() throws {
        let news = News(
            message: Message(
                results: [],
                size: 0,
                parameters: Parameters(
                    limit: "",
                    offset: ""
                )
            )
        )
        XCTAssertEqual(news.message.size, 0)
        XCTAssertEqual(news.message.parameters.limit, "")
        XCTAssertEqual(news.message.parameters.offset, "")
    }
    /// testParametersInit.
    func testParametersInit() throws {
        let parameters = Parameters(
            limit: "",
            offset: ""
        )
        XCTAssertEqual(parameters.limit, "")
        XCTAssertEqual(parameters.offset, "")
    }
    /// testResultInit.
    func testResultInit() throws {
        let result = Result(
            id: 0,
            title: "",
            subtitle: "",
            timestamp: 0
        )
        XCTAssertEqual(result.id, 0)
        XCTAssertEqual(result.title, "")
        XCTAssertEqual(result.subtitle, "")
        XCTAssertEqual(result.timestamp, 0)
    }
    /// testDetailNewsInit.
    func testDetailNewsInit() throws {
        let detailNews = DetailNews(
            message: DetailMessage(
                id: 0,
                title: "",
                subtitle: "",
                body: "",
                timestamp: 0
            )
        )
        XCTAssertEqual(detailNews.message.id, 0)
        XCTAssertEqual(detailNews.message.title, "")
        XCTAssertEqual(detailNews.message.subtitle, "")
        XCTAssertEqual(detailNews.message.body, "")
        XCTAssertEqual(detailNews.message.timestamp, 0)
    }
    /// testDetailMessageInit.
    func testDetailMessageInit() throws {
        let detailMessage = DetailMessage(
            id: 0,
            title: "",
            subtitle: "",
            body: "",
            timestamp: 0
        )
        XCTAssertEqual(detailMessage.id, 0)
        XCTAssertEqual(detailMessage.title, "")
        XCTAssertEqual(detailMessage.subtitle, "")
        XCTAssertEqual(detailMessage.body, "")
        XCTAssertEqual(detailMessage.timestamp, 0)
    }
    /// testGetNews.
    func testGetNews() async throws {
        let newsAPI = LeithaNetwork()
        let mockNewsData = News(
            message: Message(
                results: [],
                size: 0,
                parameters: Parameters(
                    limit: "0",
                    offset: "0"
                )
            )
        )
        let mockData = try JSONEncoder().encode(mockNewsData)
        MockURLProtocol.requestHandler = { request in
            (HTTPURLResponse(), mockData)
        }
        let codable = await newsAPI.getNews(with: 0, offset: 0)
        if let news = codable as? News {
            XCTAssertEqual(news.message.parameters.offset, "0")
        } else {
            XCTFail()
        }
    }
    /// testGetDetailNews.
    func testGetDetailNews() async throws {
        let newsAPI = LeithaNetwork()
        let mockDetailNewsData = DetailMessage(
            id: 0,
            title: "",
            subtitle: "",
            body: "",
            timestamp: 0
        )
        let mockData = try JSONEncoder().encode(mockDetailNewsData)
        MockURLProtocol.requestHandler = { request in
            (HTTPURLResponse(), mockData)
        }
        let codable = await newsAPI.getDetail(with: 0)
        if let detailNews = codable as? DetailNews {
            XCTAssertEqual(detailNews.message.id, 0)
        } else {
            XCTFail()
        }
    }
}
