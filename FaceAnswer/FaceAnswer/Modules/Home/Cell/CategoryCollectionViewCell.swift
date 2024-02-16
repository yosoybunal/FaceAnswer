//
//  CategoryCollectionViewCell.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 29.01.2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

  static let identifier = "categoryCell"

  // MARK: - Public Properties -

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textLabel: UILabel!

  // MARK: - Configuration -

  func configure(categoryName: String) {
    textLabel.text = categoryName.uppercased()
    textLabel.font = .systemFont(ofSize: 17, weight: .light)
    textLabel.textColor = .black
    imageView.image = categoryName == "Galatasaray Legends" ? UIImage(systemName: "flag.filled.and.flag.crossed")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal) : UIImage(systemName: "film.circle")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    textLabel.numberOfLines = 0
  }
}
