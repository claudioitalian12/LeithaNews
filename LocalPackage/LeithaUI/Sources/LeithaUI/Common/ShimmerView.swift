//
//  ShimmerView.swift
//  
//
//  Created by Claudio Cavalli on 23/09/22.
//

import UIKit

// MARK: - ShimmerView
/// The default shimmer view.
class ShimmerView: UIView {
    /// addGradientLayer.
    private func getGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(
            x: 0.0,
            y: 1.0
        )
        gradientLayer.endPoint = CGPoint(
            x: 1.0,
            y: 1.0
        )
        gradientLayer.colors = [
            LeithaResources.Colors.Shimmer().primaryColor as Any,
            LeithaResources.Colors.Shimmer().secondaryColor as Any,
            LeithaResources.Colors.Shimmer().primaryColor as Any
        ]
        gradientLayer.locations = [
            0.0,
            0.5,
            1.0
        ]
        self.layer.addSublayer(gradientLayer)
        return gradientLayer
    }
    /// addAnimation.
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [
            -1.0,
             -0.5,
             0.0
        ]
        animation.toValue = [
            1.0,
            1.5,
            2.0
        ]
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        animation.duration = 1.0
        return animation
    }
    /// startAnimating.
    func startAnimating() {
        let gradientLayer = getGradientLayer()
        let animation = getAnimation()
       
        gradientLayer.add(
            animation,
            forKey: animation.keyPath
        )
    }
    /// stopAnimating.
    func stopAnimating() {
        self.layer.sublayers = nil
    }
}
