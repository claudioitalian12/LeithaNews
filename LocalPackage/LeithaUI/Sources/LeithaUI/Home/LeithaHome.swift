//
//  LeithaHome.swift
//  
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews
import UIKit
import Combine

// MARK: - LeithaHome
/// The default view.
public class LeithaHome: UIViewController, LeithaHomeController {
    /// The ViewModel.
    public var viewModel: LeithaHomeViewModel?
    /// cancellables.
    private var cancellables: Set<AnyCancellable> = []
    /// tableView.
    private let tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero
        )
        return tableView
    }()
    /// the init view.
    public init(viewModel: LeithaHomeViewModel?) {
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
    /// viewDidLoad.
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        getNews()
    }
    /// the setup view.
    public func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            CardCell.self,
            forCellReuseIdentifier: CardCell.reuseIdentifier
        )
        view.addSubview(tableView)
    }
    /// the setup interaction view.
    public func setupInteraction() {
        self.viewModel?.newsPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] news in
                guard let self = self else { return }
                self.tableView.reloadData()
            })
            .store(in: &cancellables)
    }
    /// the setup view style.
    public func style() {
        /// view
        view.backgroundColor = LeithaResources.Colors.Commons().white
        /// tableView
        tableView.backgroundColor = LeithaResources.Colors.Commons().white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    /// the setup view layout.
    public func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20.0
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20.0
            )
        ])
    }
    /// didTapCell.
    private func didTapCell(id: Int) {
        self.viewModel?.appNavigator?.push(
            to: LeithaDetail(
                viewModel: self.viewModel?.getInstance(
                    to: .detail(id: id)
                ) as? LeithaDetailViewModel
            )
        )
    }
    /// getNews.
    private func getNews() {
        Task {
          await self.viewModel?.getNews()
        }
    }
}
// MARK: - extension LeithaHome UITableViewDataSource
extension LeithaHome: UITableViewDataSource {
    /// numberOfSections.
    public func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel?.getNumberOfSection() ?? 10
    }
    /// numberOfRowsInSection.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.getNumberOfRow() ?? 1
    }
    /// tableView cellForItemAt.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CardCell.reuseIdentifier,
            for: indexPath) as? CardCell else {
            return UITableViewCell()
        }
        cell.cardViewModel = viewModel?.getcardNewsModelFromIndex(index: indexPath)
        cell.layoutIfNeeded()
        return cell
    }
}
// MARK: - extension LeithaHome UITableViewDelegate
extension LeithaHome: UITableViewDelegate {
    /// tableView didSelectRowAt.
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapCell(id: indexPath.section)
    }
    /// tableView viewForFooterInSection.
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
    /// tableView heightForFooterInSection.
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        20
    }
    /// tableView estimatedHeightForRowAt.
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.numberOfSections - 9 == indexPath.section {
            getNews()
        }
    }
}
// MARK: - Preview LeithaHome
/// The live preview.
import SwiftUI
struct LeithaHome_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            // Return LeithaHome to preview
            let vc = LeithaHome(viewModel: nil)
            return vc
        }
    }
}
