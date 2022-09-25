//
//  LeithaDetail.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews
import UIKit
import Combine

// MARK: - LeithaDetail
/// The default view.
public class LeithaDetail: UIViewController, LeithaDetailController {
    /// The ViewModel.
    public var viewModel: LeithaDetailViewModel?
    /// scrollView.
    private let scrollView = UIScrollView()
    /// contentStack.
    private let contentStack = UIStackView()
    /// headerStack.
    private let headerStack = UIStackView()
    /// bodyStack.
    private let bodyStack = UIStackView()
    /// titleLabel.
    private let titleLabel = UILabel()
    /// subtitleLabel.
    private let subtitleLabel = UILabel()
    /// bodyLabel.
    private let bodyLabel = UILabel()
    /// dateLabel.
    private let dateLabel = UILabel()
    /// shimmerView.
    private let shimmerView = ShimmerView()
    /// cancellables.
    private var cancellables: Set<AnyCancellable> = []
    /// the init view.
    public init(viewModel: LeithaDetailViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.setup()
        self.setupInteraction()
        self.style()
        self.layout()
        self.shimmerStart()
    }
    /// the required init view.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// viewDidLoad.
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
          await self.viewModel?.getDetailNews()
        }
    }
    /// the setup view.
    public func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)
        contentStack.addArrangedSubview(headerStack)
        contentStack.addArrangedSubview(bodyStack)
        headerStack.addArrangedSubview(titleLabel)
        headerStack.addArrangedSubview(subtitleLabel)
        bodyStack.addArrangedSubview(bodyLabel)
        bodyStack.addArrangedSubview(dateLabel)
        view.addSubview(shimmerView)
    }
    /// the setup interaction view.
    public func setupInteraction() {
        self.viewModel?.detailNewsPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] details in
                guard let self = self else { return }
                self.update()
            })
            .store(in: &cancellables)
    }
    /// the setup view style.
    public func style() {
        /// view.
        view.backgroundColor = LeithaResources.Colors.Commons().white
        /// contentStack.
        contentStack.axis = .vertical
        contentStack.distribution = .equalCentering
        contentStack.alignment = .leading
        contentStack.spacing = 20.0
        contentStack.isLayoutMarginsRelativeArrangement = true
        /// headerStack.
        headerStack.axis = .vertical
        headerStack.spacing = 20.0
        /// bodyStack.
        bodyStack.axis = .vertical
        bodyStack.spacing = 20.0
        /// titleLabel.
        titleLabel.numberOfLines = 0
        titleLabel.text = "NumberLabel".localized
        titleLabel.textColor = LeithaResources.Colors.Commons().black
        titleLabel.font = LeithaResources.Fonts.Commons().get(
            .Bold,
            size: 30.0
        )
        /// subtitleLabel.
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "SubLabel".localized
        subtitleLabel.textColor = LeithaResources.Colors.Commons().black
        subtitleLabel.font = LeithaResources.Fonts.Commons().get(
            .SemiBold,
            size: 20.0
        )
        /// bodyTextView.
        bodyLabel.numberOfLines = 0
        bodyLabel.backgroundColor = LeithaResources.Colors.Commons().white
        bodyLabel.text = "BodyLabel".localized
        bodyLabel.textColor = LeithaResources.Colors.Commons().black
        bodyLabel.font = LeithaResources.Fonts.Commons().get(
            .Medium,
            size: 15.0
        )
        /// dateLabel.
        dateLabel.numberOfLines = 0
        dateLabel.text = "DateLabel".localized
        dateLabel.textColor = LeithaResources.Colors.Commons().black
        dateLabel.font = LeithaResources.Fonts.Commons().get(
            .Regular,
            size: 15.0
        )
        /// shimmerView
        shimmerView.isUserInteractionEnabled = false
    }
    /// the setup view layout.
    public func layout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        shimmerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            contentStack.topAnchor.constraint(
                equalTo: scrollView.topAnchor
            ),
            contentStack.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor
            ),
            contentStack.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor
            ),
            contentStack.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor
            ),
            contentStack.widthAnchor.constraint(
                equalTo: view.widthAnchor
            ),
            shimmerView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            shimmerView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            shimmerView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            shimmerView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])
        contentStack.layoutMargins = UIEdgeInsets(
            top: 20.0,
            left: 20.0,
            bottom: 20.0,
            right: 20.0
        )
    }
    /// shimmerStart.
    private func shimmerStart() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.shimmerView.startAnimating()
        }
    }
    /// update.
    private func update() {
        titleLabel.text = viewModel?.getDetailTitle() ?? "TitleErrorLabel".localized
        subtitleLabel.text = viewModel?.getDetailSubtitle() ?? "SubErrorLabel".localized
        bodyLabel.text = viewModel?.getDetailBody() ?? "BodyErrorLabel".localized
        dateLabel.text = viewModel?.getDetailDate() ?? "DateErrorLabel".localized
        self.shimmerView.stopAnimating()
        self.view.layoutIfNeeded()
    }
}
// MARK: - Preview LeithaDetail
/// The live preview.
import SwiftUI
struct LeithaDetail_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            // Return LeithaDetail to preview
            let vc = LeithaDetail(viewModel: nil)
            return vc
        }
    }
}
