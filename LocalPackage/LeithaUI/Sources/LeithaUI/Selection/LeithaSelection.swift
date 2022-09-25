//
//  LeithaSelection.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews
import UIKit

// MARK: - LeithaSelection
/// The default view.
public class LeithaSelection: UIViewController, LeithaSelectionController {
    /// The ViewModel.
    public var viewModel: LeithaSelectionViewModel?
    /// content Stack
    private let contentStack = UIStackView()
    /// buttons Stack
    private let buttonsStack = UIStackView()
    /// titleLabel.
    private let titleLabel = UILabel()
    /// uikitButton.
    private let uikitButton = UIButton()
    /// switfUIButton.
    private let switfUIButton = UIButton()
    /// the init view.
    public init(viewModel: LeithaSelectionViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.setup()
        self.setupInteraction()
        self.style()
        self.layout()
    }
    /// the required init view.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// the setup view.
    public func setup() {
        view.addSubview(contentStack)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(buttonsStack)
        buttonsStack.addArrangedSubview(uikitButton)
        buttonsStack.addArrangedSubview(switfUIButton)
    }
    /// the setup interaction view.
    public func setupInteraction() {
        uikitButton.addTarget(
            self,
            action: #selector(didTapUIKitButton),
            for: .touchUpInside
        )
        switfUIButton.addTarget(
            self,
            action: #selector(didTapSwiftUIButton),
            for: .touchUpInside
        )
    }
    /// the setup view style.
    public func style() {
        // view
        view.backgroundColor = LeithaResources.Colors.Commons().white
        // contentStack
        contentStack.axis = .vertical
        contentStack.distribution = .equalCentering
        // titleLabel
        titleLabel.font = LeithaResources.Fonts.Commons().get(
            .Bold,
            size: 35.0
        )
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.text = "SelectionTitle".localized
        titleLabel.textColor = LeithaResources.Colors.Commons().black
        // buttonsStack
        buttonsStack.axis = .vertical
        buttonsStack.distribution = .equalCentering
        buttonsStack.spacing = 20.0
        // uikitButton
        uikitButton.setTitle(
            "UikitButtonTitle".localized,
            for: .normal
        )
        uikitButton.titleLabel?.font = LeithaResources.Fonts.Commons().get(
            .Bold,
            size: 25.0
        )
        uikitButton.layer.cornerRadius = 10.0
        uikitButton.backgroundColor = .black
        // switfUIButton
        switfUIButton.setTitle(
            "SwiftUIButtonTitle".localized,
            for: .normal
        )
        switfUIButton.titleLabel?.font = LeithaResources.Fonts.Commons().get(
            .Bold,
            size: 25.0
        )
        switfUIButton.layer.cornerRadius = 10.0
        switfUIButton.backgroundColor = .black
    }
    /// the setup view layout.
    public func layout() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        uikitButton.translatesAutoresizingMaskIntoConstraints = false
        switfUIButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20.0
            ),
            contentStack.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            contentStack.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            contentStack.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20.0
            ),
            uikitButton.heightAnchor.constraint(
                equalToConstant: 80.0
            ),
            switfUIButton.heightAnchor.constraint(
                equalToConstant: 80.0
            )
        ])
    }
}
// MARK: - @objc extension LeithaSelection
@objc private extension LeithaSelection {
    /// didTapUIKitButton.
    func didTapUIKitButton() {
        let homeViewModel = self.viewModel?.getInstance(
            to: .home
        ) as? LeithaHomeViewModel
        homeViewModel?.appNavigator = self.viewModel?.appNavigator
        self.viewModel?.appNavigator?.push(
            to: LeithaHome(
                viewModel: homeViewModel
            )
        )
    }
    /// didTapSwiftUIButton.
    func didTapSwiftUIButton() {
        let homeViewModel = self.viewModel?.getInstance(
            to: .home
        ) as? LeithaHomeViewModel
        homeViewModel?.appNavigator = self.viewModel?.appNavigator
        self.viewModel?.appNavigator?.push(
            to: UIHostingController(
                rootView: LeithaHomeSwiftUI(
                    with: viewModel?.getInstance(to: .homeSwiftUI) as? LeithaHomeViewModel
                )
            )
        )
    }
}
// MARK: - Preview LeithaSelection
/// The live preview.
import SwiftUI
struct LeithaSelection_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            // Return LeithaSelection to preview
            let vc = LeithaSelection(viewModel: nil)
            return vc
        }
    }
}
