//
//  LeithaNavigator.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews
import UIKit

// MARK: - class AppNavigator
/// Leitha app navigator.
public class LeithaNavigator: AppNavigator {
    /// The root navigator.
    public var navigationController: UINavigationController
    /// The init navigator with destination.
    public required init(rootViewController: UIViewController) {
        self.navigationController = UINavigationController(rootViewController: rootViewController)
    }
    /// push a destination.
    public func push(to destination: UIViewController) {
        navigationController.pushViewController(destination, animated: true)
    }
    /// present a destination.
    public func present(to destination: UIViewController) {
        navigationController.present(destination, animated: true)
    }
}
