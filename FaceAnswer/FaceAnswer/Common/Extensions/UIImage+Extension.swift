//
//  UIImage+Extension.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 16.02.2024.
//

import UIKit

extension UIImage {
  static func animatedImage(withAnimatedGIFData data: Data) -> UIImage? {
    guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }

    let count = CGImageSourceGetCount(source)

    var images = [UIImage]()
    var duration = 0.0

    for i in 0..<count {
      if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
        if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
           let gifDict = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
           let frameDuration = gifDict[kCGImagePropertyGIFDelayTime as String] as? Double {
          duration += frameDuration
        }

        let image = UIImage(cgImage: cgImage)
        images.append(image)
      }
    }

    return UIImage.animatedImage(with: images, duration: duration)
  }
}
