//
//  LeithaNewsTests.swift
//  LeithaNewsTests
//
//  Created by Claudio Cavalli on 21/09/22.
//

import XCTest
@testable import LeithaNews
@testable import LeithaUI
@testable import LeithaViewModel

class LeithaNewsTests: XCTestCase {
    /// appDelegate
    private let appDelegate = AppDelegate()
    /// testInitAppDelegate
    func testInitAppDelegate() throws {
        XCTAssertTrue(appDelegate.initialDestination())
        XCTAssertNotNil(appDelegate.appNavigator)
    }
}
