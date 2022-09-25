//
//  LeithaViewModel.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import Foundation
import UIKit
import Combine

// MARK: - LeithaViewModel
/// The default view model.
public protocol LeithaViewModel: AnyObject {
    /// appNavigator.
    var appNavigator: AppNavigator? { get set }
    /// getInstance of LeithaViewModel.
    func getInstance(to destination: Destination) -> LeithaViewModel?
}
// MARK: - LeithaSelectionViewModel
/// The default selection view model.
public protocol LeithaSelectionViewModel: LeithaViewModel {}
// MARK: - LeithaHomeViewModel
/// The default home view model.
public protocol LeithaHomeViewModel: LeithaViewModel {
    var newsPublisher: Published<Bool>.Publisher { get }
    func getNews() async -> Int
    func getNumberOfSection() -> Int
    func getNumberOfRow() -> Int
    func getcardNewsModelFromIndex(index: IndexPath) -> LeithaCardViewModel?
}
// MARK: - LeithaDetailViewModel
/// The default detail view model.
public protocol LeithaDetailViewModel: LeithaViewModel {
    var detailNewsPublisher: Published<Bool>.Publisher { get }
    func getDetailTitle() -> String?
    func getDetailSubtitle() -> String?
    func getDetailBody() -> String?
    func getDetailDate() -> String?
    func getDetailNews() async -> Bool
}
// MARK: - LeithaCardViewModel
/// The default card view model.
public protocol LeithaCardViewModel {
    func getNumberNews() -> String?
    func getTitleNews() -> String?
    func getDateNews() -> String?
}
