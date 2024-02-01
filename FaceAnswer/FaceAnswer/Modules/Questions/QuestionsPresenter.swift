//
//  QuestionsPresenter.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 25.01.2024.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class QuestionsPresenter {

  // MARK: - Private properties -

  private unowned let view: QuestionsViewInterface
  private let interactor: QuestionsInteractorInterface
  private let wireframe: QuestionsWireframeInterface

  // MARK: - Lifecycle -

  init(view: QuestionsViewInterface, interactor: QuestionsInteractorInterface, wireframe: QuestionsWireframeInterface) {
    self.view = view
    self.interactor = interactor
    self.wireframe = wireframe
  }
}

// MARK: - Extensions -

extension QuestionsPresenter: QuestionsPresenterInterface {
  func getSelectedUserData() -> Dictionary<String, Bool> {
    let userSelecetion = interactor.fetchData()
    return userSelecetion
  }
  func setSelectedUserScore(_ score: Int64) {
    interactor.saveScore(score)
  }
}
