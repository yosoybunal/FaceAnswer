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
    imageView.image = categoryName == "Galatasaray Legends" ? UIImage(systemName: "figure.soccer")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal) : UIImage(systemName: "movieclapper")?.withTintColor(.darkGray, renderingMode: .alwaysOriginal)
    textLabel.numberOfLines = 0
  }
}
