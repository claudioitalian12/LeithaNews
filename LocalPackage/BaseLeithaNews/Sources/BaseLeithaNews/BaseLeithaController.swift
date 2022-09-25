//
//  BaseLeithaController.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import Foundation
import UIKit

// MARK: - LeithaController
/// The default view.
public protocol LeithaController: UIViewController {
    /// the setup view.
    func setup()
    /// the setup interaction view.
    func setupInteraction()
    /// the setup view style.
    func style()
    /// the setup view layout.
    func layout()
}
// MARK: - LeithaSelectionController
/// The default selection view.
public protocol LeithaSelectionController: LeithaController {
    /// The ViewModel.
    var viewModel: LeithaSelectionViewModel? { get set }
}
// MARK: - LeithaHomeController
/// The default home view.
public protocol LeithaHomeController: LeithaController {
    /// The ViewModel.
    var viewModel: LeithaHomeViewModel? { get set }
}
// MARK: - LeithaDetailController
/// The default detail view.
public protocol LeithaDetailController: LeithaController {
    /// The ViewModel.
    var viewModel: LeithaDetailViewModel? { get set }
}
