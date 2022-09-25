//
//  File.swift
//  
//
//  Created by Claudio Cavalli on 24/09/22.
//

import BaseLeithaNews
import SwiftUI

// MARK: - NewsRow
/// The default view.
struct NewsRow: View {
    /// news.
    var news: LeithaCardViewModel?
    /// init.
    init(news: LeithaCardViewModel?) {
        self.news = news
    }
    /// body.
    var body: some View {
        VStack(spacing: 30) {
            Text(news?.getNumberNews() ?? "NumberErrorLabel".localized)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            VStack(spacing: 10) {
                Text(news?.getTitleNews() ?? "TitleErrorLabel".localized)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                Text(news?.getDateNews() ?? "DateErrorLabel".localized)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
            }
        }
        .padding(10)
    }
}
// MARK: - NewsRowRow_Previews
/// The default preview.
struct NewsRowRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(news: nil)
    }
}
