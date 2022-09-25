//
//  BaseLeithaNews.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import Foundation
import UIKit

// MARK: - BaseLeithaNewsDelegate
/// The default app delegate.
public protocol BaseLeithaNewsDelegate: AnyObject {
    /// The root window.
    var window: UIWindow? { get set }
    /// The root app navigator.
    var appNavigator: AppNavigator? { get set }
}
