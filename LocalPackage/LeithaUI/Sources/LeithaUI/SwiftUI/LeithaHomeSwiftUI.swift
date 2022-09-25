//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 24/09/22.
//

import BaseLeithaNews
import SwiftUI
import Combine

// MARK: - LeithaHomeSwiftUI
/// The default view.
struct LeithaHomeSwiftUI: View {
    /// viewModel.
    private var viewModel: LeithaHomeViewModel?
    /// numerOfElement.
    @State var numeberOfElement = 0
    /// init.
    init(with viewModel: LeithaHomeViewModel?) {
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = LeithaResources.Colors.Commons().white
    }
    /// body.
    var body: some View {
        Color.white
            .ignoresSafeArea(.all)
            .overlay(
                List {
                    ForEach(
                        0..<numeberOfElement,
                        id: \.self
                    ) { index in
                        NavigationLink(
                            destination: LeithaDetailSwiftUI(
                                with: viewModel?.getInstance(to: .detail(id: index)) as? LeithaDetailViewModel
                            )
                        ) {
                            NewsRow(
                                news: viewModel?.getcardNewsModelFromIndex(
                                    index: IndexPath(
                                        item: 0,
                                        section: index
                                    )
                                )
                            )
                        }
                    }
                    ProgressView()
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity
                        )
                        .onAppear(perform: fetchData)
                }
            )
    }
    /// fetchData.
    private func fetchData() {
        guard let viewModel = viewModel else {
            return
        }
        Task {
            numeberOfElement = await viewModel.getNews()
        }
    }
}
// MARK: - LeithaHomeSwiftUI_Previews
/// The default preview.
struct LeithaHomeSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        LeithaHomeSwiftUI(with: nil)
    }
}
