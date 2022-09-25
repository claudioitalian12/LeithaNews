//
//  CardCell.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews
import UIKit

// MARK: - CardCell
/// CardCell.
class CardCell: UITableViewCell {
    /// reuseIdentifier.
    public static let reuseIdentifier = "CardCell"
    /// contentStack.
    private let contentStack = UIStackView()
    /// messageStack.
    private let messageStack = UIStackView()
    /// numberLabel.
    private let numberLabel = UILabel()
    /// titleLabel.
    private let titleLabel = UILabel()
    /// dateLabel.
    private let dateLabel = UILabel()
    /// shimmerView.
    private let shimmerView = ShimmerView()
    /// viewModel.
    var cardViewModel: LeithaCardViewModel? {
        didSet {
            self.update()
        }
    }
    /// init.
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.shimmerStart()
        numberLabel.text = "NumberLabel".localized
        titleLabel.text = "TitleLabel".localized
        dateLabel.text = "DateLabel".localized
        cardViewModel = nil
    }
    /// init.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        self.setup()
        self.style()
        self.layout()
        self.shimmerStart()
    }
    /// required init.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// setup.
    private func setup() {
        contentView.addSubview(contentStack)
        contentStack.addArrangedSubview(numberLabel)
        contentStack.addArrangedSubview(messageStack)
        messageStack.addArrangedSubview(titleLabel)
        messageStack.addArrangedSubview(dateLabel)
        contentView.addSubview(shimmerView)
    }
    /// style.
    private func style() {
        contentView.backgroundColor = LeithaResources.Colors.Commons().white
        // contentStack
        contentStack.backgroundColor = LeithaResources.Colors.Commons().black
        contentStack.axis = .vertical
        contentStack.distribution = .fillProportionally
        contentStack.alignment = .leading
        contentStack.spacing = 20.0
        contentStack.layer.cornerRadius = 10.0
        contentStack.isLayoutMarginsRelativeArrangement = true
        // messageStack
        messageStack.axis = .vertical
        // numberLabel
        numberLabel.numberOfLines = 0
        numberLabel.text = "NumberLabel".localized
        numberLabel.textColor = LeithaResources.Colors.Commons().white
        numberLabel.font = LeithaResources.Fonts.Commons().get(
            .Bold,
            size: 20.0
        )
        // titleLabel
        titleLabel.numberOfLines = 0
        titleLabel.text = "TitleLabel".localized
        titleLabel.textColor = LeithaResources.Colors.Commons().white
        titleLabel.font = LeithaResources.Fonts.Commons().get(
            .Medium,
            size: 20.0
        )
        // dateLabel
        dateLabel.numberOfLines = 0
        dateLabel.text = "DateLabel".localized
        dateLabel.textColor = LeithaResources.Colors.Commons().white
        dateLabel.font = LeithaResources.Fonts.Commons().get(
            .Regular,
            size: 15.0
        )
    }
    /// layout.
    private func layout() {
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        shimmerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            contentStack.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            contentStack.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            contentStack.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            shimmerView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            shimmerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            shimmerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            shimmerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
        contentStack.layoutMargins = UIEdgeInsets(
            top: 10.0,
            left: 10.0,
            bottom: 10.0,
            right: 10.0
        )
    }
    /// shimmerStart.
    private func shimmerStart() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.shimmerView.startAnimating()
        }
    }
    /// shimmerStop.
    private func shimmerStop() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.shimmerView.stopAnimating()
        }
    }
    /// update.
    private func update() {
        guard let cardViewModel = cardViewModel else {
            return
        }
        numberLabel.text = cardViewModel.getNumberNews() ?? "NumberErrorLabel".localized
        titleLabel.text = cardViewModel.getTitleNews() ?? "TitleErrorLabel".localized
        dateLabel.text = cardViewModel.getDateNews() ?? "DateErrorLabel".localized
        shimmerStop()
    }
}
// MARK: - Preview CardCell
/// The live preview.
import SwiftUI
struct CardCellViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        CardCell()
    }
    func updateUIView(_ view: UIView, context: Context) {}
}
struct CardCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack(
            alignment: .center,
            spacing: 20.0
        ) {
            CardCellViewRepresentable()
        }
        .frame(
            width: UIScreen.main.bounds.width - 20.0,
            height: 120.0,
            alignment: .center
        )
    }
}
