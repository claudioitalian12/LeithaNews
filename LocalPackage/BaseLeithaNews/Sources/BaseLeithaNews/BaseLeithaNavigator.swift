//
//  BaseLeithaNavigator.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import Foundation
import UIKit

// MARK: - AppNavigator
/// The navigation manager.
public protocol AppNavigator: AnyObject {
    /// The root navigator.
    var navigationController: UINavigationController { get set }
    /// The init.
    init(rootViewController: UIViewController)
    /// push a destination.
    func push(to destination: UIViewController)
    /// present a destination.
    func present(to destination: UIViewController)
}
// MARK: - Destination
/// The destination case.
public enum Destination {
    /// The app selection.
    case selection
    /// The app home.
    case home
    /// The app detail.
    case detail(id: Int)
    /// The app home swiftui.
    case homeSwiftUI
}
