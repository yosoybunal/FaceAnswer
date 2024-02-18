//
//  ResultsInteractor.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import CoreData
import UIKit

final class ResultsInteractor {
  fileprivate var currentScore: Int64?
  let context = CoreDataService.shared.context
}

// MARK: - Extensions -

extension ResultsInteractor: ResultsInteractorInterface {
  func fetchCurrentScore() -> Int64 {
    do {
      self.currentScore = try context.fetch(User.fetchRequest()).last?.score
    } catch {
      print(error.localizedDescription)
    }
    return currentScore!
  }
  
  func fetchAllScores() -> [Int64] {
    var scores: [Int64] = []
    do {
      let _ = try context.fetch(User.fetchRequest()).map { user in
          guard user.score != 1000 else { return }
          scores.append(user.score)
      }
    } catch {
      print(error.localizedDescription)
    }
    return scores
  }
}
