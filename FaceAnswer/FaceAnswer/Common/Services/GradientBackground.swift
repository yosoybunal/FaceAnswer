//
//  GradientBackground.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 29.01.2024.
//

import UIKit

class GradientBackground: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.isOpaque = false
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)

    UIColor.white.setFill()
    UIRectFill(rect)

    //// General Declarations
    let context = UIGraphicsGetCurrentContext()!

    //// Gradient Declarations
    let paint0_linear2 = CGGradient(colorsSpace: nil, colors: [Colors.gradientColor0.cgColor, Colors.gradientColor1.cgColor] as CFArray, locations: [0, 1])!

    context.drawLinearGradient(paint0_linear2,
                               start: CGPoint(x: 363.75, y: -664.71),
                               end: CGPoint(x: 900.13, y: 234.82),
                               options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
  }
}
