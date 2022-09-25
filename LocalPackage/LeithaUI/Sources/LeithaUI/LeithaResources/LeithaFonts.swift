//
//  LeithaFonts.swift
//
//
//  Created by Claudio Cavalli on 22/09/22.
//

import UIKit

// MARK: - LeithaResources Fonts
/// The Fonts.
extension LeithaResources.Fonts {
    // MARK: - Commons
    struct Commons {
        /// Traits.
        enum Traits: String {
            case SemiBold = "MavenPro-SemiBold"
            case Medium = "MavenPro-Medium"
            case Bold = "MavenPro-Bold"
            case Regular = "MavenPro-Regular"
            case ExtraBold = "MavenPro-ExtraBold"
            case Black = "MavenPro-Black"
        }
        /// get return UIFont.
        func get(_ trait: Traits, size: CGFloat) -> UIFont? {
            loadCustomFonts(for: "ttf") ? UIFont(name: trait.rawValue, size: size):UIFont.systemFont(ofSize: 0.0)
        }
        /// loadCustomFonts return Bool.
        private func loadCustomFonts(for fontExtension: String) -> Bool {
            let fileManager = FileManager.default
            let bundleURL = Bundle.module.bundleURL
            do {
                let contents = try fileManager.contentsOfDirectory(
                    at: bundleURL,
                    includingPropertiesForKeys: [],
                    options: .skipsHiddenFiles
                )
                contents.forEach { url in
                    if url.pathExtension == fontExtension {
                        guard let fontData = NSData(contentsOf: url) else {
                            return
                        }
                        guard let provider = CGDataProvider(data: fontData),
                              let font = CGFont(provider) else { fatalError() }
                        
                        CTFontManagerRegisterGraphicsFont(font, nil)
                    }
                }
            } catch {
                print("error: \(error)")
            }
            return true
        }
    }
}
