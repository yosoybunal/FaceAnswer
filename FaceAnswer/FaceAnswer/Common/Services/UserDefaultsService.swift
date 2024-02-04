//
//  UserDefaultsService.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 26.01.2024.
//

import Foundation

class UserDefaultsService {

  static let shared = UserDefaultsService()

  private let userDefaults: UserDefaults

  private init() {
    userDefaults = .standard
  }

  // MARK: - Fetch and Save -

  func setUserName(_ userName: String) {
    userDefaults.setValue(userName, forKey: "userNick")
  }

  func getUserName() -> String? {
    userDefaults.string(forKey: "userNick")
  }
}
