//
//  ResultsTableViewCell.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 1.02.2024.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

  static let identifier = "tableViewCell"

  // MARK: - Public Properties -

  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var iconView: UIImageView!

  // MARK: - Configuration -

  func configure(userName: String, scoreLabel: String) {
    self.iconView.image = UIImage(systemName: "person.fill")
    self.scoreLabel.text = scoreLabel
    self.userName.text = userName
  }
}
