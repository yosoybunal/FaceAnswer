//
//  UIStoryboardExtension.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//

import UIKit

extension UIStoryboard {
  
  func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
    let identifier = identifier ?? String(describing: T.self)
    return instantiateViewController(withIdentifier: identifier) as! T
  }
  
}
