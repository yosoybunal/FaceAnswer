//
//  QuestionsInteractor.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class QuestionsInteractor {
  
  var selectedCategory: Dictionary<String, Bool>?
  let context = CoreDataService.shared.context
}

// MARK: - Extensions -

extension QuestionsInteractor: QuestionsInteractorInterface {
  
  func fetchData() -> Dictionary<String, Bool> {
    do {
      self.selectedCategory = try context.fetch(User.fetchRequest()).last?.selectedCategory
    } catch {
      print(error.localizedDescription)
    }
    return selectedCategory!
  }
  
  func saveScore(_ score: Int64) {
    let user = CoreDataService.shared.user
    user.score = score
    do {
      try context.save()
    }
    catch {
      print(error.localizedDescription)
    }
  }
}
