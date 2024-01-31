//
//  QuestionsViewController.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class QuestionsViewController: UIViewController {

  // MARK: - Public properties -

  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!

  weak var countdownTimer: Timer?
  var presenter: QuestionsPresenterInterface!
  var remainingTime = 6
  var selectedCategory: Dictionary<String, Bool>?

  // MARK: - Lifecycle -

  override func viewDidLoad() {
    super.viewDidLoad()
    timerLabel.text = "TIME STARTS NOW!"
    questionLabel.text = "Question 1"
    startTimer()
    getUserData()
  }

  func startTimer() {
    countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
  }

  func stopTimer() {
    countdownTimer?.invalidate()
    countdownTimer = nil
    timerLabel.text = ""
  }


  @objc func updateTimer() {
    if remainingTime > 0 {
      remainingTime -= 1
      timerLabel.text = "\(remainingTime) seconds"
    } else {
      stopTimer()
      showTimeAlert()
    }
  }

  private func showTimeAlert() {
    let alert = UIAlertController(title: "Time's up!", message: "The correct answer is:", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default) { _ in
      self.remainingTime = 6
      self.startTimer()
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}

// MARK: - Extensions -

extension QuestionsViewController: QuestionsViewInterface {
  func getUserData() {
    self.selectedCategory = presenter.getSelectedUserData()
    print("Questions VC:", selectedCategory)
  }
}
