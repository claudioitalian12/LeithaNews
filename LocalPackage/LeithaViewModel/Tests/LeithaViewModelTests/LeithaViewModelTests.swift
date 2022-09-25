import XCTest
@testable import LeithaViewModel

final class LeithaViewModelTests: XCTestCase {
    /// CardViewModelInit.
    func testCardViewModelInit() {
        let cardViewModel = CardViewModel(news: nil)
        
        XCTAssertEqual(cardViewModel.getTitleNews(), nil)
        XCTAssertEqual(cardViewModel.getDateNews(), nil)
        XCTAssertEqual(cardViewModel.getTitleNews(), nil)
    }
    /// DetailView.
    func testDetailViewModelInit() {
        let detailViewModel = DetailViewModel(id: 0)
        
        XCTAssertEqual(detailViewModel.getDetailTitle(), nil)
        XCTAssertNil(detailViewModel.appNavigator)
        XCTAssertNil(detailViewModel.getDetailDate())
        XCTAssertNil(detailViewModel.getDetailBody())
        XCTAssertNil(detailViewModel.getDetailSubtitle())
    }
    /// HomeViewModel.
    func testHomeViewModelInit() {
        let homeViewModel = HomeViewModel()
        
        XCTAssertEqual(homeViewModel.getNumberOfRow(), 1)
        XCTAssertEqual(homeViewModel.getNumberOfSection(), 10)
        XCTAssertNil(homeViewModel.getcardNewsModelFromIndex(index: IndexPath(item: 0, section: 0)))
    }
    /// SelectionViewModel.
    func testSelectionViewModelInit() {
        let selectionViewModel = SelectionViewModel()
        
        XCTAssertNil(selectionViewModel.appNavigator)
    }
}
