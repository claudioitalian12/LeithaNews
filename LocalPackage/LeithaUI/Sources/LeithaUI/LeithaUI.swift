//
//  LeithaUI.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews
import UIKit
import SwiftUI

// MARK: - UIViewControllerPreview
/// The default preview.
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    /// generic viewController.
    let viewController: ViewController
    /// init.
    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    /// makeUIViewController.
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    /// updateUIViewController.
    func updateUIViewController(_ uiViewController: ViewController, context: Context) { }
}
// MARK: - String
public extension String {
  var localized: String {
      NSLocalizedString(self, bundle: Bundle.module, comment: "")
    }
}
