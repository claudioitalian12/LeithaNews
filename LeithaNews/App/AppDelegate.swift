//
//  AppDelegate.swift
//  LeithaNews
//
//  Created by Claudio Cavalli on 21/09/22.
//

import UIKit
import BaseLeithaNews
import LeithaUI
import LeithaViewModel
import LeithaNavigator

// MARK: - @main class AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate, BaseLeithaNewsDelegate {
    /// The root window.
    var window: UIWindow?
    /// The root app navigator.
    var appNavigator: AppNavigator?
    /// application launchOptions.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initialDestination()
    }
}
// MARK: - extension AppDelegate
extension AppDelegate {
    /// init and set the destination.
    func initialDestination() -> Bool {
        let selectionViewModel = SelectionViewModel()
        let selectionView = LeithaSelection(
            viewModel: selectionViewModel
        )
        self.appNavigator = LeithaNavigator(
            rootViewController: selectionView
        )
        selectionViewModel.appNavigator = self.appNavigator
        self.window = UIWindow()
        self.window?.rootViewController = self.appNavigator?.navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
