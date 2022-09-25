//
//  MockURLProtocol.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import XCTest

class MockURLProtocol: URLProtocol {
    /// requestHandler.
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    /// canInit.
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    /// canonicalRequest.
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    /// startLoading.
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            XCTFail("Received unexpected request with no handler set")
            return
        }
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    /// stopLoading.
    override func stopLoading() {}
}
