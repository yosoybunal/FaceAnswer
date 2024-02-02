//
//  ResultsTableViewCell.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 1.02.2024.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var iconView: UIImageView!

  static let identifier = "tableViewCell"

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func configure(userName: String, scoreLabel: String) {
    self.iconView.image = UIImage(systemName: "person.fill")
    self.scoreLabel.text = scoreLabel
    self.userName.text = userName
  }
}
