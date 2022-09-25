import XCTest
@testable import LeithaUI

final class LeithaUITests: XCTestCase {
    /// testSelectionBlackColor.
    func testSelectionBlackColor() throws {
        XCTAssertNotNil(LeithaResources.Colors.Commons().black)
    }
    /// testSelectionWhiteColor.
    func testSelectionWhiteColor() throws {
        XCTAssertNotNil(LeithaResources.Colors.Commons().white)
    }
    /// testBoldFonts.
    func testBoldFont() throws {
        XCTAssertNotNil(LeithaResources.Fonts.Commons().get(.Bold, size: 20.0))
    }
    /// testBlackFont.
    func testBlackFont() throws {
        XCTAssertNotNil(LeithaResources.Fonts.Commons().get(.Black, size: 20.0))
    }
    /// testExtraBoldFont.
    func testExtraBoldFont() throws {
        XCTAssertNotNil(LeithaResources.Fonts.Commons().get(.ExtraBold, size: 20.0))
    }
    /// testMediumFont.
    func testMediumFont() throws {
        XCTAssertNotNil(LeithaResources.Fonts.Commons().get(.Medium, size: 20.0))
    }
    /// testRegularFont.
    func testRegularFont() throws {
        XCTAssertNotNil(LeithaResources.Fonts.Commons().get(.Regular, size: 20.0))
    }
    /// testSemiBoldFont.
    func testSemiBoldFont() throws {
        XCTAssertNotNil(LeithaResources.Fonts.Commons().get(.SemiBold, size: 20.0))
    }
    /// testInitSelection.
    func testInitSelection() throws {
        let selection = LeithaSelection(viewModel: nil)
        XCTAssertNil(selection.viewModel)
    }
    /// testInitHome.
    func testInitHome() throws {
        let home = LeithaHome(viewModel: nil)
        XCTAssertNil(home.viewModel)
    }
    /// testInitCard.
    func testInitCard() throws {
        let card = CardCell(frame: .zero)
        XCTAssertEqual(card.layer.sublayers?.count, 1)
    }
    /// testinitDetail.
    func testInitDetail() throws {
        let detail = LeithaDetail(viewModel: nil)
        XCTAssertNil(detail.viewModel)
    }
    /// testShimmerAnimation.
    func testShimmerAnimation() throws {
        let shimmer = ShimmerView(frame: .zero)
        shimmer.startAnimating()
        XCTAssertEqual(shimmer.layer.sublayers?.count, 1)
    }
    /// testShimmerStopAnimation.
    func testShimmerStopAnimation() throws {
        let shimmer = ShimmerView(frame: .zero)
        shimmer.startAnimating()
        shimmer.stopAnimating()
        XCTAssertEqual(shimmer.layer.sublayers?.count, nil)
    }
}
