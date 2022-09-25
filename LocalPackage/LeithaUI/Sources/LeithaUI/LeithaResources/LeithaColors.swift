//
//  LeithaColors.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import UIKit

// MARK: - LeithaResources Colors
extension LeithaResources.Colors {
    // MARK: - Commons
    struct Commons {
        init() { }
        let black = UIColor(named: "black", in: Bundle.module, compatibleWith: nil)
        let white = UIColor(named: "white", in: Bundle.module, compatibleWith: nil)
    }
    // MARK: - Shimmer
    struct Shimmer {
        init() { }
        /// primaryColor.
        let primaryColor = UIColor(named: "primaryColor", in: Bundle.module, compatibleWith: nil)?.cgColor
        /// secondaryColor.
        let secondaryColor = UIColor(named: "secondaryColor", in: Bundle.module, compatibleWith: nil)?.cgColor
    }
}
