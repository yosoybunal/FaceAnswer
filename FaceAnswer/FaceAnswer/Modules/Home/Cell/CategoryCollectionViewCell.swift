//
//  CategoryCollectionViewCell.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 29.01.2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

  static let identifier = "categoryCell"

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textLabel: UILabel!

  func configure(categoryName: String) {
    textLabel.text = categoryName
    textLabel.font = .systemFont(ofSize: 18, weight: .semibold)
    textLabel.textColor = .black
    imageView.image = UIImage(systemName: "film.circle.fill")
    textLabel.numberOfLines = 0
  }
}
