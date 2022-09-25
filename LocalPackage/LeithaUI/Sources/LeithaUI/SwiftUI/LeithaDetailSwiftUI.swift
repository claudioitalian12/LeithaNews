//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 24/09/22.
//

import BaseLeithaNews
import SwiftUI
import Combine

// MARK: - LeithaDetailSwiftUI
/// The default view.
struct LeithaDetailSwiftUI: View {
    /// viewModel.
    private var viewModel: LeithaDetailViewModel?
    /// isPlaceholder.
    @State var isPlaceholder = true
    /// init.
    init(with viewModel: LeithaDetailViewModel?) {
        self.viewModel = viewModel
    }
    /// body.
    var body: some View {
        Color.white
            .ignoresSafeArea(.all)
            .overlay(
                ScrollView {
                    VStack(spacing: 20) {
                        Text(viewModel?.getDetailTitle() ?? "TitleErrorLabel".localized)
                            .foregroundColor(.black)
                            .font(
                                Font(
                                    LeithaResources.Fonts.Commons().get(
                                        .Bold,
                                        size: 30.0
                                    ) ?? .systemFont(ofSize: 30.0)
                                )
                            )
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                        Text(viewModel?.getDetailSubtitle() ?? "SubErrorLabel".localized)
                            .foregroundColor(.black)
                            .font(
                                Font(
                                    LeithaResources.Fonts.Commons().get(
                                        .SemiBold,
                                        size: 20.0
                                    ) ?? .systemFont(ofSize: 20.0)
                                )
                            )
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                        Text(viewModel?.getDetailBody() ?? "BodyErrorLabel".localized)
                            .foregroundColor(.black)
                            .font(
                                Font(
                                    LeithaResources.Fonts.Commons().get(
                                        .Medium,
                                        size: 15.0
                                    ) ?? .systemFont(ofSize: 15.0)
                                )
                            )
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                        Text(viewModel?.getDetailDate() ?? "DateErrorLabel".localized)
                            .foregroundColor(.black)
                            .font(
                                Font(
                                    LeithaResources.Fonts.Commons().get(
                                        .Regular,
                                        size: 10.0
                                    ) ?? .systemFont(ofSize: 10.0)
                                )
                            )
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                    }
                    .padding(20.0)
                }
            )
            .redacted(reason: isPlaceholder ? .placeholder:[])
            .onAppear(perform: getDetailNews)
    }
    /// getDetailNews.
    private func getDetailNews() {
        guard let viewModel = viewModel else {
            return
        }
        Task {
            isPlaceholder = await viewModel.getDetailNews()
        }
    }
}
// MARK: - LeithaDetailSwiftUI_Previews
/// The default preview.
struct LeithaDetailSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        LeithaHomeSwiftUI(with: nil)
    }
}
