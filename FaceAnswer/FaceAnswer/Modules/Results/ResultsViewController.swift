//
//  ResultsViewController.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ResultsViewController: UIViewController {

  @IBOutlet weak var returnToHomeButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var currentScoreLabel: UILabel!

  // MARK: - Public properties -

  var currentScore: Int64?
  var presenter: ResultsPresenterInterface!
  var allUserScores: [Int64] = []

  // MARK: - Lifecycle -

  override func viewDidLoad() {
    super.viewDidLoad()
    getCurrentUserScore()
    getAllUserScores()
    setupUI()
    tableView.dataSource = self
    tableView.reloadData()
  }

  private func setupUI() {
    tableView.register(UINib(nibName: "ResultsTableViewCell", bundle: nil), forCellReuseIdentifier: ResultsTableViewCell.identifier)
    tableView.showsVerticalScrollIndicator = false
    tableView.showsHorizontalScrollIndicator = false
    currentScoreLabel.text = "Current Quiz Result: \(currentScore ?? 0)"
  }

  @IBAction func returnToHome(_ sender: Any) {
    presenter.returnToHome()
  }
}

// MARK: - Extensions -

extension ResultsViewController: ResultsViewInterface {
  func getCurrentUserScore() {
    self.currentScore = presenter.fetchCurrentScore()
  }

  func getAllUserScores() {
    self.allUserScores = presenter.fetchAllScores()
  }
}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return allUserScores.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.identifier, for: indexPath) as? ResultsTableViewCell else { return UITableViewCell() }
    cell.configure(userName: "\(UserDefaultsService.shared.getUserName() ?? "Username")", scoreLabel: "Score: \(allUserScores[indexPath.row])")
    return cell
  }
}
