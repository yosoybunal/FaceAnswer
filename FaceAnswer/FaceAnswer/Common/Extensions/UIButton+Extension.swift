//
//  UIButton+Extension.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 29.01.2024.
//

import UIKit

extension UIButton {
  func applyGradient(colours: [UIColor], cornerRadius: CGFloat?, startPoint: CGPoint, endPoint: CGPoint)  {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    if let cornerRadius = cornerRadius {
      gradient.cornerRadius = cornerRadius
    }
    gradient.locations = [0.0, 1.0]
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    gradient.colors = colours.map { $0.cgColor }
    self.layer.insertSublayer(gradient, at: 0)
  }
}
