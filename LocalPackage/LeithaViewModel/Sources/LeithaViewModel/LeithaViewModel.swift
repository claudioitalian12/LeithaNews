//
//  LeithaViewModel.swift
//
//
//  Created by Claudio Cavalli on 21/09/22.
//

import BaseLeithaNews

// MARK: - public LeithaViewModel
public extension LeithaViewModel {
    /// getInstance.
    func getInstance(to destination: Destination) -> LeithaViewModel? {
        switch destination {
        case .selection:
            return SelectionViewModel()
        case .home, .homeSwiftUI:
            return HomeViewModel()
        case .detail(let id):
            return DetailViewModel(id: id)
        }
    }
}
