//
//  LeithaNewsUITests.swift
//  LeithaNewsUITests
//
//  Created by Claudio Cavalli on 21/09/22.
//

import XCTest
@testable import LeithaUI

class LeithaNewsUITests: XCTestCase {
    /// setUpWithError
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    /// testLaunchApp
    func testLaunchApp() throws {
        let app = XCUIApplication()
        app.launch()
    }
    /// testOpenUiKit
    func testOpenUiKit() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["UikitButtonTitle".localized].tap()
    }
    /// testOpenSwiftUI
    func testOpenSwiftUI() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["SwiftUIButtonTitle".localized].tap()
    }
    /// testLaunchPerformance
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
