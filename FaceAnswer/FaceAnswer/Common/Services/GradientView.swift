//
//  GradientView.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 26.01.2024.
//

import UIKit

class GradientView: UIView {

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

    let context = UIGraphicsGetCurrentContext()!
    let paint0_linear2 = CGGradient(colorsSpace: nil, colors: [Colors.gradientColor0.cgColor, Colors.gradientColor1.cgColor] as CFArray, locations: [0, 1])!

    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 0, y: height / 1.2))
    bezierPath.addLine(to: CGPoint(x: width / 2, y: height))
    bezierPath.addLine(to: CGPoint(x: width, y: height / 1.2))
    bezierPath.addLine(to: CGPoint(x: width, y: 0))
    bezierPath.addLine(to: CGPoint(x: 0, y: 0))
    bezierPath.addLine(to: CGPoint(x: 0, y: height / 1.2))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    context.saveGState()
    bezierPath.addClip()
    context.drawLinearGradient(paint0_linear2,
                               start: CGPoint(x: 363.75, y: -664.71),
                               end: CGPoint(x: 900.13, y: 234.82),
                               options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
    context.restoreGState()
  }
}


